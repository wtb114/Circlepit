class TopController < ApplicationController

  def index
    @artists = Artist.limit(30).order("created_at DESC")
    # @event = Event.order("RAND()").first
  end
end
