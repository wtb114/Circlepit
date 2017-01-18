class ArtistsController < ApplicationController

  def index
    @count = Artist.all
    @search = Artist.search(params[:q])
    @artists = @search.result.order("updated_at DESC").page(params[:page]).per(20)

    respond_to do |format|
      format.html
      format.json { render json: @artists }
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @events = Event.where(artist_id: @artist.id).all.order("created_at DESC").page(params[:page]).per(20)
    @events2 = Event.where(artist_id2: @artist.id).all.order("created_at DESC").page(params[:page]).per(20)
    @events3 = Event.where(artist_id3: @artist.id).all.order("created_at DESC").page(params[:page]).per(20)
    @events4 = Event.where(artist_id4: @artist.id).all.order("created_at DESC").page(params[:page]).per(20)
    @events5 = Event.where(artist_id5: @artist.id).all.order("created_at DESC").page(params[:page]).per(20)
    @events6 = Event.where(artist_id6: @artist.id).all.order("created_at DESC").page(params[:page]).per(20)
    @events7 = Event.where(artist_id7: @artist.id).all.order("created_at DESC").page(params[:page]).per(20)
    @events8 = Event.where(artist_id8: @artist.id).all.order("created_at DESC").page(params[:page]).per(20)
    @events9 = Event.where(artist_id9: @artist.id).all.order("created_at DESC").page(params[:page]).per(20)
    @events10 = Event.where(artist_id10: @artist.id).all.order("created_at DESC").page(params[:page]).per(20)
    @events.push(@events2).push(@events3).push(@events4).push(@events5).push(@events6).push(@events7).push(@events8).push(@events9).push(@events10).flatten!

    @favorites = Favorite.where(artist_id: @artist.id).all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_name: artist_params[:artist_name], artist_name_japanese: artist_params[:artist_name_japanese], artist_image_url: artist_params[:artist_image_url], artist_url: artist_params[:artist_url], user_id: current_user.id)
    if @artist.save
      render :create
    else
      render "common/error_artist"
    end
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
    @artist = Artist.find(params[:id])
    @artist.update(artist_params) if @artist.user_id == current_user.id
    if @artist.save
      render :update
    else
      render :edit
    end
  end

  private
  def artist_params
    params.permit(:artist_name, :artist_name_japanese, :artist_image_url,:artist_url)
  end

end
