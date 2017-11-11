class Player < ApplicationRecord
  def has_hand?
    card1.present?
  end

  def hand
    [].tap do |hand|
      hand << translate_card_code(card1) if card1.present?
      hand << translate_card_code(card2) if card2.present?
    end
  end

  def card1=(card)
    code = translate_card_object(card)
    super(code)
  end

  def card2=(card)
    code = translate_card_object(card)
    super(code)
  end

private

  def translate_card_code(code)
    Card.new(JSON.parse(code).transform_keys(&:to_sym))
  end

  def translate_card_object(card)
    card.to_hash.to_json
  end
end
