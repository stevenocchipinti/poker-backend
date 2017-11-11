class Card
  attr_reader :suit, :value

  def initialize(suit:, value:)
    @suit = suit
    @value = value
  end

  def to_s
    "#{value.downcase} of #{suit.downcase}"
  end

  def to_hash
    {
      suit: suit,
      value: value,
    }
  end
end
