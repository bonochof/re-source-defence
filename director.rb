class Director
  PHASE = [:draw, :standby, :main, :battle, :end]

  def initialize
    @title = Image.new(Window.width, Window.height, C_BLUE)
    @background = Image.new(Window.width, Window.height, C_WHITE)
    @menus = {:draw => Menu.new(0, 0, C_BLUE, "Draw"),
              :standby => Menu.new(0, 50, C_GREEN, "Standby"),
              :main => Menu.new(0, 100, C_RED, "Main"),
              :battle => Menu.new(0, 150, C_BLACK, "Battle"),
              :end => Menu.new(0, 200, C_BLACK, "End")}
    @mapIds = [[0, 1, 2, 0],
              [2, 0, 0, 1, 2],
              [1, 1, 2, 0]]
    @map = MapData.new(100, 200, @mapIds)
    @scene = :title
    @pnum = 0
    @phase = PHASE[@pnum]
    @cards = [Card.new(100, 300, CardInfo::MARKET),
              Card.new(250, 300, CardInfo::FARM),
              Card.new(400, 300, CardInfo::TEST)]
    @deck = Deck.new
    @mouse = Mouse.new
    @kingdom = Kingdom.new
  end

  def input
    @mouse.x = Input.mouse_pos_x
    @mouse.y = Input.mouse_pos_y
    @mouse.push = Input.mouse_push?(M_LBUTTON)
  end

  def play
    case @scene
    when :title
      @scene = :game if Input.key_down?(K_SPACE)
    when :game
      case @phase
      when :draw
      when :standby
      when :main
      when :battle
      when :end
      end
      if @mouse === @menus[@phase] and @mouse.push
        @pnum += 1
        @pnum %= PHASE.length
        @phase = PHASE[@pnum]
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
      Sprite.draw(@menus[@phase])
      @map.draw
      Sprite.draw(@cards)
    end
  end
end
