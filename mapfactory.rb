class MapFactory
  def create(x, y, mapId)
    return Sprite.new(x, y, Image.load("./img/map.bmp", mapId * 32, 0, 32, 32))
  end
end
