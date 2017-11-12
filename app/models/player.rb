class Player < ApplicationRecord
  def has_hand?
    card1.present?
  end

  def hand
    [card1, card2]
  end

  def card1=(card)
    code = translate_card_object(card)
    super(code)
  end

  def card2=(card)
    code = translate_card_object(card)
    super(code)
  end

  def card1
    translate_card_code(super)
  end

  def card2
    translate_card_code(super)
  end

private

  def translate_card_code(code)
    Card.new(JSON.parse(code).transform_keys(&:to_sym)) if code.present?
  end

  def translate_card_object(card)
    card.to_hash.to_json if card.present?
  end
end
