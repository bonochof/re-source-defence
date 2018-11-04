class Deck
  def initialize(new_cards)
    @cards = []
    new_cards.each do |card|
      @cards.push(card)
    end
  end


end
