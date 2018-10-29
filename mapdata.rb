class MapData
  def initialize(x, y, ary_tileId)
    @mapImages = Image.load_tiles("./img/map.bmp", 8, 8, true)
    @mapTiles = []

    ary_tileId.each_with_index do |ary, i|
      lines = []
      ary.each_with_index do |elm, j|
        lines << Sprite.new(x + j * 32, y + i * 32, @mapImages[elm])
      end
      @mapTiles << lines
    end
  end

  def draw
    Sprite.draw(@mapTiles)
  end
end
