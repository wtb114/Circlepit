class ArtistsController < ApplicationController

  def index
    @artists = Artist.all.order("created_at DESC").page(params[:page]).per(5)
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
  end

  def create
    Artist.create(artist_name: artist_params[:artist_name], artist_name_japanese: artist_params[:artist_name_japanese], artist_image_url: artist_params[:artist_image_url], artist_url: artist_params[:artist_url], user_id: current_user.id)
    redirect_to :root and return
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy if @artist.user_id == current_user.id
    redirect_to artists_path
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params) if artist.user_id == current_user.id
     redirect_to artists_path
  end

  private
  def artist_params
    params.permit(:artist_name, :artist_name_japanese, :artist_image_url,:artist_url)
  end

end
