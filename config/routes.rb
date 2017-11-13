Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  post "/deal" => "game#deal"
  post "/flop" => "game#flop"
  post "/turn" => "game#turn"
  post "/river" => "game#river"
  post "/end-round" => "game#end_round"
  post "/end-game" => "game#end_game"
end
