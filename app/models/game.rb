class Game < ApplicationRecord
  def flop
    [
      deserialize_card(card1),
      deserialize_card(card2),
      deserialize_card(card3),
    ]
  end

  def turn
    deserialize_card(card4)
  end

  def river
    deserialize_card(card5)
  end

  def communal
    [flop, turn, river].flatten
  end

  def card1=(card)
    code = serialize_card(card)
    super(code)
  end

  def card2=(card)
    code = serialize_card(card)
    super(code)
  end

  def card3=(card)
    code = serialize_card(card)
    super(code)
  end

  def card4=(card)
    code = serialize_card(card)
    super(code)
  end

  def card5=(card)
    code = serialize_card(card)
    super(code)
  end

  def clear
    Player.all.map(&:fold)
    self.card1 = nil
    self.card2 = nil
    self.card3 = nil
    self.card4 = nil
    self.card5 = nil
    save!
  end

private

  def deserialize_card(code)
    Card.new(JSON.parse(code).transform_keys(&:to_sym)) if code.present?
  end

  def serialize_card(card)
    card.to_hash.to_json if card.present?
  end
end
