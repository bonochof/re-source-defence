class Director
  def initialize
    @title = Image.new(Window.width, Window.height, C_BLUE)
    @background = Image.new(Window.width, Window.height, C_WHITE)
    @menus = {:build => Menu.new(1, 10, 10, C_BLUE, "Build"),
              :training => Menu.new(2, 300, 30, C_GREEN, "Training")}
    @cells = []
    @mapIds = [[0, 1, 2, 0],
              [2, 0, 0, 1, 2],
              [1, 1, 2, 0]]
    @map = MapData.new(100, 200, @mapIds)
    @scene = :start
    @cards = [Card.new(100, 300, "harvest", "+1 food", :color1=>C_GREEN, :color2=>C_WHITE),
              Card.new(250, 300, "tax", "+1 gold", :color1=>C_YELLOW, :color2=>C_WHITE),
              Card.new(400, 300, "0123456789", "0123456789", :color1=>C_BLUE, :color2=>[255, 100, 100, 100])]
    @mouse = Mouse.new
  end

  def input
    @mouse.x = Input.mouse_pos_x
    @mouse.y = Input.mouse_pos_y
    @mouse.push = Input.mouse_push?(M_LBUTTON)
  end

  def play
    case @scene
    when :start
      @scene = :game if Input.key_down?(K_SPACE)
    when :game
      Sprite.update(@menus.to_a)
      Sprite.check(@mouse, @menus.to_a)
=begin
      10.times do |y|
        10.times do |x|
          #@cells << Cell.new(x * 21, y * 21)
        end
      end
=end
    end
  end

  def draw
    case @scene
    when :start
      Window.draw(0, 0, @title)
    when :game
      Window.draw(0, 0, @background)
      Sprite.draw(@cells)
      Sprite.draw(@menus.to_a)
      @map.draw
      Sprite.draw(@cards)
    end
  end
end
