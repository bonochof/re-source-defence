class Card < Sprite
  CARD_WIDTH = 100
  CARD_HEIGHT = 160
  def initialize(x, y, name, text)
    @name = name
    @text = text
    @nameFont = Font.new(24)
    @textFont = Font.new(16)
    super(x, y, Image.new(CARD_WIDTH, CARD_HEIGHT, C_BLUE))
  end

  def draw
    super
    Window.draw_font(self.x, self.y, @name, @nameFont, :color=>C_WHITE)
    Window.draw_font(self.x, self.y + 50, @text, @textFont, :color=>C_WHITE)
  end
end
