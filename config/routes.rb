Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get "/deal" => "game#deal"
  get "/flop" => "game#flop"
  get "/turn" => "game#turn"
  get "/river" => "game#river"
end
