Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get "/deal" => "game#deal"
  get "/flop" => "game#flop"
  get "/turn" => "game#turn"
  get "/river" => "game#river"
  get "/end-round" => "game#end_round"
  get "/end-game" => "game#end_game"
end
