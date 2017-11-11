class GameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "game_all_players"
    Player.find_or_create_by name: params[:player]
    stream_from "game_#{params[:player]}"
  end
end
