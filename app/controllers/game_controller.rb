class GameController < ApplicationController
  def deal
    players.each do |player|
      player.card1 = deck.draw
      player.card2 = deck.draw
      player.save!
      Rails.logger.info("[deal] player: #{player.to_json}")

      ActionCable.server.broadcast("game_#{player.name}",
        hand: player.hand.map{ |card| card&.to_hash },
      )
    end
    head :ok
  end

  def end_round
    game.end_round
    Rails.logger.info("[end_round] game: #{game.to_json}")

    ActionCable.server.broadcast("game_all",
      communal: game.communal.map{ |card| card&.to_hash },
      hand: [],
    )
    head :ok
  end

  def end_game
    game.destroy

    ActionCable.server.broadcast("game_all",
      communal: 5.times.map{ nil },
      hand: []
    )
    head :ok
  end

  def flop
    game.card1 = deck.draw
    game.card2 = deck.draw
    game.card3 = deck.draw
    game.save!
    Rails.logger.info("[flop] game: #{game.to_json}")

    ActionCable.server.broadcast("game_all",
      communal: game.communal.map{ |card| card&.to_hash },
    )
    head :ok
  end

  def turn
    game.card4 = deck.draw
    game.save!
    Rails.logger.info("[turn] game: #{game.to_json}")

    ActionCable.server.broadcast("game_all",
      communal: game.communal.map{ |card| card&.to_hash },
    )
    head :ok
  end

  def river
    game.card5 = deck.draw
    game.save!
    Rails.logger.info("[river] game: #{game.to_json}")

    ActionCable.server.broadcast("game_all",
      communal: game.communal.map{ |card| card&.to_hash },
    )
    head :ok
  end

  def players
    Player.all
  end

  def game
    @game ||= Game.first_or_create
  end

  def deck
    @deck ||= Deck.new_without(cards: (cards_dealt + game.communal).flatten)
  end

  def cards_dealt
    players.select(&:has_hand?).map(&:hand).flatten
  end
end
