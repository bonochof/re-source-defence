class Menu
  POS_X = 10
  POS_Y = 10
  WIDTH = 64 * 3
  HEIGHT = 48 * 3

  def initialize
    @cursor = 0
    @font = Font.new(24, "Consolas", :weight=>true)
  end

  def select
  end

  def draw
    Window.draw_box_fill(POS_X, POS_Y, POS_X + WIDTH, POS_Y + HEIGHT, C_BLACK)
    Window.draw_box(POS_X + 3, POS_Y + 3, POS_X + WIDTH - 3, POS_Y + HEIGHT - 3, C_WHITE)
    Window.draw_font(POS_X + 70, POS_Y + 5, "Menu", @font)
  end
end
