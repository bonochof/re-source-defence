class Director
  def initialize
    @title = Image.new(Window.width, Window.height, C_BLUE)
    @background = Image.new(Window.width, Window.height, C_WHITE)
    @menus = {:build => Menu.new(1, 10, 10, C_BLUE, "Build"),
              :training => Menu.new(2, 300, 30, C_GREEN, "Training")}
    @cells = []
    @mapId = [[0, 1, 2, 0],
              [2, 0, 0, 1, 2],
              [1, 1, 2, 0]]
    @map = MapData.new(100, 200, @mapId)
    @scene = :start
    @card = Card.new(100, 100, "title", "text")
  end

  def input
  end

  def play
    case @scene
    when :start
      @scene = :game if Input.key_down?(K_SPACE)
    when :game
      10.times do |y|
        10.times do |x|
          @cells << Cell.new(x * 21, y * 21)
        end
      end
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
      @card.draw
    end
  end
end
