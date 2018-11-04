class Menu < Sprite
  FONT_SIZE = 24
  @@font = Font.new(FONT_SIZE, "Consolas", :weight=>true)

  def initialize(x, y, color, str)
    @str = str
    super(x, y, Image.new(100, 50, color))
  end

  def draw
    super
    Window.draw_font(self.x, self.y, @str, @@font)
  end
end
