class Deck
  def initialize()
    @deck_recipe = [
      [CardInfo::FARM, 3],
      [CardInfo::MARKET, 3],
      [CardInfo::TEST, 1]
    ]
    @deck = []
    build
    show
  end

  def build
    @deck_recipe.each do |card|
      card[1].times do
        @deck << card[0]
      end
    end
    @deck = @deck.shuffle
  end

  def show
    p "----- deck recipe -----"
    @deck_recipe.each_with_index do |info, i|
      p "#{info[0][0]} * #{info[1]}"
    end
    p "-------- deck --------"
    @deck.each_with_index do |info, i|
      p "#{i}: #{info[0]}"
    end
  end
end
