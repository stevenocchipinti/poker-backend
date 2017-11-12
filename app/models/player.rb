class Player < ApplicationRecord
  def has_hand?
    card1.present?
  end

  def hand
    [
      deserialize_card(card1),
      deserialize_card(card2),
    ]
  end

  def card1=(card)
    code = serialize_card(card)
    super(code)
  end

  def card2=(card)
    code = serialize_card(card)
    super(code)
  end

private

  def deserialize_card(code)
    Card.new(JSON.parse(code).transform_keys(&:to_sym)) if code.present?
  end

  def serialize_card(card)
    card.to_hash.to_json if card.present?
  end
end
