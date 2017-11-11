class DeckChannel < ApplicationCable::Channel
  def subscribed
    stream_from "deck"
  end
end
