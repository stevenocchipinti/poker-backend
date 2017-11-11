Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get "/deal" => "game#deal"
end
