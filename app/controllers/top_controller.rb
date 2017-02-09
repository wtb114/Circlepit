class TopController < ApplicationController

  def index
    @artists = Artist.order("RANDOM()").limit(30)
    # @event = Event.order("RAND()").first
  end
end
