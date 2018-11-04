require 'dxruby'

require_relative 'director'
require_relative 'mouse'
require_relative 'menu'
require_relative 'cell'
require_relative 'mapdata'
require_relative 'card'

Window.caption = "RE:source Defence"
#Window.width = 800
#Window.height = 600

director = Director.new

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  director.input
  director.play
  director.draw
end
