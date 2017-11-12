class Game < ApplicationRecord
  def flop
    [card1, card2, card3]
  end

  def turn
    card4
  end

  def river
    card5
  end

  def communal
    [card1, card2, card3, card4, card5]
  end

  def card1=(card)
    code = translate_card_object(card)
    super(code)
  end

  def card2=(card)
    code = translate_card_object(card)
    super(code)
  end

  def card3=(card)
    code = translate_card_object(card)
    super(code)
  end

  def card4=(card)
    code = translate_card_object(card)
    super(code)
  end

  def card5=(card)
    code = translate_card_object(card)
    super(code)
  end

  def card1
    translate_card_code(super)
  end

  def card2
    translate_card_code(super)
  end

  def card3
    translate_card_code(super)
  end

  def card4
    translate_card_code(super)
  end

  def card5
    translate_card_code(super)
  end

  def clear
    Player.update_all(card1: nil, card2: nil)
    card1 = nil
    card2 = nil
    card3 = nil
    card4 = nil
    card5 = nil
    save!
  end

private

  def translate_card_code(code)
    Card.new(JSON.parse(code).transform_keys(&:to_sym)) if code.present?
  end

  def translate_card_object(card)
    card.to_hash.to_json if card.present?
  end
end
