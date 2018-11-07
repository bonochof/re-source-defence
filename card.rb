module CardInfo
  #INFO = [name, text, main color, sub color, effect]
  FARM = ["farm", "+1 food", C_GREEN, C_WHITE, Proc.new do
    Kingdom.food += 1
  end]

  MARKET = ["market", "+1 gold", C_YELLOW, C_WHITE, Proc.new do
    Kingdom.gold += 1
  end]

  TEST = ["test", "01234567890this is newline test", C_BLUE, [255, 200, 200, 200], Proc.new do
    p "card effect test!"
  end]
end

class Card < Sprite
  CARD_WIDTH = 100
  CARD_HEIGHT = 140
  NAME_SIZE = 24
  TEXT_SIZE = 16
  @@name_font = Font.new(NAME_SIZE, "Consolas")
  @@text_font = Font.new(TEXT_SIZE, "Consolas")

  def initialize(x, y, name = CardInfo::TEST)
    @name = name[0]
    @text = name[1]
    @color_main = name[2]
    @color_sub = name[3]
    @effect = name[4]

    @card_image = Image.new(CARD_WIDTH, CARD_HEIGHT, @color_main)
    @card_image.box_fill(5, 5, CARD_WIDTH - 5, NAME_SIZE + 5, @color_sub)
    @card_image.box_fill(5, NAME_SIZE + 10, CARD_WIDTH - 5, CARD_HEIGHT - 5, @color_sub)
    @card_image.draw_font_ex(CARD_WIDTH / 2 - @@name_font.get_width(@name) / 2, 5, @name, @@name_font, :color => C_BLACK)

    @text.scan(/.{1,#{11}}/).each_with_index do |str, i|
      @card_image.draw_font_ex(5, NAME_SIZE + 10 + i * TEXT_SIZE, str, @@text_font, :color => C_BLACK)
    end
    super(x, y, @card_image)
  end

  def use
    @effect.call
    Kingdom.action -= 1
  end
end
