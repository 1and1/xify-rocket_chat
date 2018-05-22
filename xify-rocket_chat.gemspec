require 'date'

Gem::Specification.new do |s|
  s.name        = 'xify-rocket_chat'
  s.version     = '0.0.1'
  s.date        = Date.today.to_s
  s.summary     = 'Rocket.Chat extension for Xify gem.'
  s.description = <<-EOF
    Used as input and/or output handler for Xify. Listen to messages in a specified channel or send them into one. Uses
    the realtime API of Rocket.Chat (websocket) to receive messages.
  EOF
  s.license     = 'MIT'
  s.author      = 'Finn Glöe'
  s.email       = 'fgloee@united-internet.de'
  s.files       = Dir['lib/**/*.rb']

  s.add_runtime_dependency 'metybur', '~> 0.4.3'
  s.add_runtime_dependency 'xify', '>= 0.4'
end
