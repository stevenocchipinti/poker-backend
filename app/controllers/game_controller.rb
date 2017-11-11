class GameController < ApplicationController
  def deal
    players.each do |player|
      player.card1 = deck.draw
      player.card2 = deck.draw
      player.save!

      ActionCable.server.broadcast "game_#{player.name}",
        hand: player.hand.map(&:to_hash)
    end
    head :ok
  end

  def flop
    game.card1 = deck.draw
    game.card2 = deck.draw
    game.card3 = deck.draw
    game.save!

    ActionCable.server.broadcast "game_all",
      flop: game.flop.map(&:to_hash)
    head :ok
  end

  def turn
    game.card4 = deck.draw
    game.save!

    ActionCable.server.broadcast "game_all",
      turn: game.turn.to_hash
    head :ok
  end

  def river
    game.card5 = deck.draw
    game.save!

    ActionCable.server.broadcast "game_all",
      river: game.river.to_hash
    head :ok
  end

  def deck
    @deck ||= build_deck
  end

  def players
    @players ||= Player.all
  end

  def game
    @game ||= Game.first_or_create
  end

  def build_deck
    cards_dealt = players.select(&:has_hand?).map(&:hand)
    floppy_river_turn = [game.flop, game.turn, game.river]

    Deck.new_without(cards: (cards_dealt + floppy_river_turn).flatten)
  end

end
