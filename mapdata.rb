class MapData
  #@@mapImages = Image.load_tiles("./img/map.bmp", 8, 8, true)
  @@empty = Image.load("./img/map/empty.bmp")
  @@farm = Image.load("./img/map/farm.bmp")

  def initialize(x, y, tileIds)
    @mapTiles = []

    tileIds.each_with_index do |ary, i|
      lines = []
      ary.each_with_index do |elm, j|
        #lines << Sprite.new(x + j * 32, y + i * 32, @@mapImages[elm])
        lines << Sprite.new(x + j * 32, y + i * 32, @@empty)
      end
      @mapTiles << lines
    end
    @farm = Sprite.new(100, 100, @@farm)
  end

  def draw
    Sprite.draw(@mapTiles)
    @farm.draw
  end
end
