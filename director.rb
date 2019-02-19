class Director
  PHASE = [:draw, :standby, :main, :battle, :end]

  def initialize
    @title_back = Image.new(Window.width, Window.height, C_GREEN)
    @opening_back = Image.new(Window.width, Window.height, C_BLACK)
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
    @deck = Deck.new
    @hands = []
    @is_drawed = false
    @mouse = Mouse.new
    @kingdom = Kingdom.new
    @soldiers = []
    @counter = 0
    @title_font = Font.new(64, "Consolas")
    @opening_font = Font.new(24)
  end

  def input
    @mouse.x = Input.mouse_pos_x
    @mouse.y = Input.mouse_pos_y
    @mouse.push = Input.mouse_push?(M_LBUTTON)
  end

  def battle
    @soldiers.length.times do |i|
      @soldiers[i].battle
    end
  end

  def play
    case @scene
    when :title
      if Input.key_down?(K_SPACE)
        @scene = :opening
        @counter = Window.height
      end
    when :opening
      @counter -= 1
      @scene = :game if @counter < -320
    when :game
      case @phase
      when :draw
        if @is_drawed == false
          @hands = []

          for i in 0..2 do
            @hands << Card.new(100 + i * 150, 300, @deck.drawCard)
          end

          p "day: #{@kingdom.day}"
          @deck.show
          @is_drawed = true
        end
      when :standby
        @is_drawed = false
      when :main
      when :battle
        battle
      when :end
        @kingdom.gold -= 100
      end
      if @mouse === @menus[@phase] and @mouse.push
        @kingdom.dayend if @phase == :end
        @scene = :boss if @kingdom.day > 30
        @pnum += 1
        @pnum %= PHASE.length
        @phase = PHASE[@pnum]
      end
    when :boss
    end
  end

  def draw
    case @scene
    when :title
      Window.draw(0, 0, @title_back)
      Window.draw_font_ex(50, 100, "Re: Source Defence", @title_font, :color=>C_BLACK, :edge=>true, :edge_color=>C_RED, :shadow=>true)
      Window.draw_font_ex(100, 300, "Press Space Key", @title_font, :color=>C_BLACK)
    when :opening
      Window.draw(0, 0, @opening_back)
      Window.draw_font(10, @counter, "あなたはとある孤島の王国を治める王様です。\n\n\nこの国は長い間平和でしたが、\nある日を境に各地で魔物が出現するようになりました。\n\nさらに王宮魔術師の見解によれば、\n今からおよそ30日後には王国を滅ぼすほどの\n極めて強力な魔物が出現するというのです。\n\n\nあなたは王様として、\nこの国を守らなくてはなりません！", @opening_font)
    when :game
      Window.draw(0, 0, @background)
      Sprite.draw(@cells)
      Sprite.draw(@menus[@phase])
      @map.draw
      Sprite.draw(@hands)
      @kingdom.draw
    end
  end
end
