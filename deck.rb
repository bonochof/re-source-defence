class Deck
  def initialize()
    @cards = []
    build
    show
  end

  def build
    3.times do
      @cards << CardInfo::MARKET
    end
    3.times do
      @cards << CardInfo::FARM
    end
  end

  def show
    @cards.each_with_index do |info, i|
      p "#{i}: #{info[0]}"
    end
  end
end
