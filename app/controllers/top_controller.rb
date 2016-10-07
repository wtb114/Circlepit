class TopController < ApplicationController

  def index
    @artists = Artist.all
  end
end
