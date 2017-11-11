Rails.application.routes.draw do
  resources :deck, :only => :index
  mount ActionCable.server => '/cable'
end
