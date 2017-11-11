class GameChannel < ApplicationCable::Channel
  def subscribed
    Player.find_or_create_by name: params[:player]
    stream_from "game_#{params[:player]}"
    stream_from "game_all"
  end
end
