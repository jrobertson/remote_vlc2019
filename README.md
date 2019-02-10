# Introducing the remote_vlc2019 gem

## Usage

    require 'remote_vlc2019'

    vlc = RemoteVlc2019.new host: '192.168.4.193', port: '8080', password: 'password'
    vlc.stop
    vlc.volume
    sleep 2
    vlc.play
    sleep 1
    vlc.vol_down
    sleep 3
    vlc.vol_up

The above example connects to a VLC host running at *192.168.4.193* on port *8080* using password *password*.

Note:

To enable the HTTP host in VLC go to *Tools > Preferences > Show Settings all > Main interfaces > Lua* and then set a password. Then restart VLC and visit the VLC player in your browser to ensure it is accessible using HTTP basic authentication with the username left blank and the password set to whatever you chose.

## Resources

* remote_vlc2019 https://rubygems.org/gems/remote_vlc2019 

vlc vlcplayer audio audioplay gem remote remotevlc2019
