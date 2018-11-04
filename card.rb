class Card < Sprite
  CARD_WIDTH = 100
  CARD_HEIGHT = 140
  NAME_SIZE = 24
  TEXT_SIZE = 16
  @@name_font = Font.new(NAME_SIZE, "Consolas")
  @@text_font = Font.new(TEXT_SIZE, "Consolas")

  def initialize(x, y, name, text, color1: C_BLUE, color2: C_WHITE)
    @card_image = Image.new(CARD_WIDTH, CARD_HEIGHT, color1)
    @card_image.box_fill(5, 5, CARD_WIDTH - 5, NAME_SIZE + 5, color2)
    @card_image.box_fill(5, NAME_SIZE + 10, CARD_WIDTH - 5, CARD_HEIGHT - 5, color2)
    @card_image.draw_font_ex(CARD_WIDTH / 2 - @@name_font.get_width(name) / 2, 5, name, @@name_font, :color=>C_BLACK)
    @card_image.draw_font_ex(5, NAME_SIZE + 10, text, @@text_font, :color=>C_BLACK)
    super(x, y, @card_image)
  end
end
