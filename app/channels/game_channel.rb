class GameChannel < ApplicationCable::Channel
  def subscribed
    Player.find_or_create_by(name: params[:player]).tap do |player|
      player.game = Game.first_or_create
      player.save!
    end
    stream_from "game_#{params[:player]}"
    stream_from "game_all"
  end

  def fold
    Player.find(name: params[:player]).fold
    ActionCable.server.broadcast("game_#{params[:player]}",
      hand: [],
    )
  end
end
