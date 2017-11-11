class GameController < ApplicationController
  def deal
    players = Player.all
    cards_dealt = players.select(&:has_hand?).map(&:hand)
    deck = Deck.new_without(cards: cards_dealt)

    players.each do |player|
      player.card1 = deck.draw
      player.card2 = deck.draw
      player.save!

      ActionCable.server.broadcast "game_#{player.name}",
        hand: player.hand.map(&:to_hash)
    end
    head :ok
  end
end
