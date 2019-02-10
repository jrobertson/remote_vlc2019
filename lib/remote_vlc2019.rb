#!/usr/bin/env ruby

# file: remote_vlc2019.rb

require 'rexle'
require 'open-uri'

MAX_VOL = 257

class RemoteVlc2019

  attr_reader :info

  def initialize(host: nil, port: '8080', password: 'password', verbose: false)

    @host, @port, @password, verbose = host, port, password, verbose

  end

  def now_playing() @info[:now_playing]           end
  def play()        req 'pl_play'                 end
  def playing?()    state() == :playing           end
  def pause()       req 'pl_pause'                end
  def state()       status(); @state.to_sym       end
  def stop()        req 'pl_stop'                 end
  def vol()         @vol                          end
  def vol_down()    setvol(offset: -50)           end
  def vol_up()      setvol(offset: 50)            end
  def vol=(val)     setvol val  end

  alias volume vol
  alias volume= vol=

 
  def req(command='')

    url = "http://%s:%s/requests/status.xml?command=%s" \
      % [@host, @port, command]
    s = open(url + '', http_basic_authentication: ["", @password]).read
    doc = Rexle.new(s)
    @state = %w(state).map {|x| doc.root.text(x) }
    @vol = doc.root.text('volume').to_i

    @info = doc.root.xpath('information/category/info').map do |x|
      [x.attributes[:name].downcase.to_sym, x.text]
    end.to_h

    @verbose ? s : command.to_sym
  end

  alias status req

  private

  def setvol(raw_val)

    offset = raw_val.is_a?(Hash) ? raw_val[:offset] : nil
    val = offset ? @vol + offset : raw_val.to_i
    val = MAX_VOL if val > MAX_VOL and offset
    return status() unless val >= 0 and val <= MAX_VOL
    req 'volume&val=' + val.to_s
    vol()
  end

end

