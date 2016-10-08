class ArtistsController < ApplicationController

  def show
    @artist = Artist.find(params[:id])
  end

  def new
  end

  def create
    Artist.create(artist_params)
    redirect_to :root and return
  end

  private
  def artist_params
    params.permit(:artist_name, :artist_name_japanese, :artist_image_url,:artist_url)
  end

end
