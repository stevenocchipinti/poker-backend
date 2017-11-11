Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get "/deal" => "game#deal"
  get "/retract" => "game#retract"
  get "/flop" => "game#flop"
  get "/turn" => "game#turn"
  get "/river" => "game#river"
end
