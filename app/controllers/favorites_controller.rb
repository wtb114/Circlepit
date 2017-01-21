class FavoritesController < ApplicationController
  def create
    # @favorites = Favorite.all

    @user_id = current_user.id
    @artist_id = Artist.find(params[:id]).id
    @favorite = Favorite.new(artist_id: @artist_id, user_id: @user_id)

    if @favorite.save
      redirect_to favorites_path(current_user)
    else
      redirect_to favorites_path(current_user)
    end

  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      redirect_to favorites_path(current_user)
    end
  end

  def index
    @user = current_user
    @count = Favorite.where(user_id: @user.id).all
    @favorites = Favorite.where(user_id: @user.id).order("created_at DESC").page(params[:page]).per(20)
  end

  def show_favorites
    @artist = Artist.find(params[:id])
    @count = Favorite.where(artist_id: @artist.id).all
    @favorites = Favorite.where(artist_id: @artist.id).all.order("created_at DESC").page(params[:page]).per(20)
  end

  def users_favorites
    @user = User.find(params[:id])
    @count = Favorite.where(user_id: @user.id).all
    @favorites = Favorite.where(user_id: @user.id).order("created_at DESC").page(params[:page]).per(20)
  end


end
