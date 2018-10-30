class Card
  CARD_WIDTH = 100
  CARD_HEIGHT = 140
  @@cardImage = Image.new(CARD_WIDTH, CARD_HEIGHT, C_BLUE)
  @@nameFont = Font.new(24, "Consolas")
  @@textFont = Font.new(16, "Consolas")

  def initialize(x, y, name, text)
    @name = name
    @text = text
    @card = Sprite.new(x, y, @@cardImage)
    @nameArea = Sprite.new(x + 5, y + 5, Image.new(CARD_WIDTH - 10, 30, C_WHITE))
    @textArea = Sprite.new(x + 5, y + 40, Image.new(CARD_WIDTH - 10, 95, C_WHITE))
    @sprites = [@card, @nameArea, @textArea]
  end

  def draw
    Sprite.draw(@sprites)
    Window.draw_font(@nameArea.x + 45 - @@nameFont.get_width(@name) / 2, @nameArea.y, @name, @@nameFont, :color=>C_BLACK)
    Window.draw_font(@textArea.x, @textArea.y, @text, @@textFont, :color=>C_BLACK)
  end
end
