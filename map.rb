class MapData
  def initialize(x, y, ary_tileId)
    @maptiles = Image.load_tiles("./img/map.bmp", 8, 8, true)
    @map = ary_tileId
    ary_tileId.length.times do |i|
        ary_tileId[0].length.times do |j|
          @map[i][j] = Sprite.new(x + j * 32, y + i * 32,
                                  @maptiles[ary_tileId[i][j]])
        end
    end
  end

  def draw
    #@mapのすべての要素についてdrawを実行
    @map.each do |i|
      i.each do |j|
        j.draw
      end
    end
  end
end
