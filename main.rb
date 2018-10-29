require 'dxruby'

require_relative 'director'
require_relative 'menu'
require_relative 'cell'
require_relative 'mapdata'

Window.caption = "RE:source Defence"
#Window.width = 800
#Window.height = 600

director = Director.new

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  director.input
  director.play
  director.draw
end
