class TopController < ApplicationController

  def index
    @artists = Artist.order("RAND()").limit(30)
    # @event = Event.order("RAND()").first
  end
end
