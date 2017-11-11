class DeckController < ApplicationController
  def index
    ActionCable.server.broadcast 'deck',
      hand: [
        {
          suit: ['hearts','diamonds','spades', 'clubs'][rand(4)],
          value: ['A',2,3,4,5,6,7,8,9,10,'J','Q','K'][rand(13)],
        },
        {
          suit: ['hearts','diamonds','spades', 'clubs'][rand(4)],
          value: ['A',2,3,4,5,6,7,8,9,10,'J','Q','K'][rand(13)],
        },
      ]
    head :ok
  end
end
