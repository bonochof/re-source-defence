class Menu < Sprite
  FONT_SIZE = 24

  def initialize(id, x, y, color, str)
    @id = id
    @str = str
    @font = Font.new(FONT_SIZE, "Consolas", :weight=>true)
    super(x, y, Image.new(100, 50, color))
  end

  def hit(mouse)
    self.vanish if mouse.push
  end

  def draw
    super
    Window.draw_font(self.x, self.y, @str, @font)
  end
end
