class Director
  def initialize
    @cells = []
  end

  def input
  end

  def play
    10.times do |y|
      10.times do |x|
        @cells << Cell.new(x * 21, y * 21)
      end
    end
  end

  def draw
    Sprite.draw(@cells)
  end
end
