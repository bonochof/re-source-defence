class Mouse < Sprite
  attr_accessor :push

  def initialize
    super(0, 0, Image.new(10, 10, C_GREEN))
    @push = false
  end
end
