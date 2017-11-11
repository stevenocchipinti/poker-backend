class Deck
  attr_reader :cards

  def self.new_without(cards:)
    Deck.new(cards: generate_cards(without: cards))
  end

  def initialize(cards:)
    @cards = cards
  end

  def draw
    @cards.shuffle.pop
  end

private

  def self.generate_cards(without:)
    deck = ['hearts', 'clubs', 'spades', 'diamonds'].map do |suit|
      ((2..10).to_a + ['A', 'J', 'Q', 'K']).map do |value|
        Card.new(suit: suit, value: value.to_s)
      end
    end.flatten

    deck.reject do |card|
      without.map(&:to_s).include?(card.to_s)
    end
  end
end
