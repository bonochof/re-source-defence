class Kingdom
  attr_accessor :gold, :attack, :defence, :action
  FONT_SIZE = 24
  @@font = Font.new(FONT_SIZE, "Consolas")

  def initialize
    @day = 1
    @gold = 0
    @attack = 0
    @defence = 0
    @action = 1
  end

  def dayend
    @day += 1
  end

  def draw
    Window.draw_font(500, 0, "Day: #{@day}", @@font, :color => C_BLACK)
  end
end
