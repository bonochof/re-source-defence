class Card < Sprite
  def initialize(x, y, color)
    super(x, y, Image.new(50, 100, color))
  end
end
