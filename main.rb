require 'dxruby'

require_relative 'director'

Window.caption = "RE:source Defence"
#Window.width = 800
#Window.height = 600

director = Director.new

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  director.input
  director.play
end
