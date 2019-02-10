Gem::Specification.new do |s|
  s.name = 'remote_vlc2019'
  s.version = '0.1.0'
  s.summary = 'Sends remote commands to VLC via HTTP.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/remote_vlc2019.rb']
  s.add_runtime_dependency('rexle', '~> 1.5', '>=1.5.1')
  s.signing_key = '../privatekeys/remote_vlc2019.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/remote_vlc2019'
end
