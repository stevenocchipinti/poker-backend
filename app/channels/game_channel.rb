class GameChannel < ApplicationCable::Channel
  def subscribed
    Player.find_or_create_by name: params[:player]
    stream_from "game_#{params[:player]}"
    stream_from "game_all"
  end

  def fold
    Player.find_or_create_by(name: params[:player]).fold
    ActionCable.server.broadcast("game_#{player.name}",
      hand: [],
    )
  end
end
