class TopController < ApplicationController

  def index
    @artists = Artist.all.order("created_at DESC").page(params[:page]).per(5)
  end
end
