class FavoritesController < ApplicationController
  def create
    @user_id = current_user.id
    @artist_id = Artist.find(params[:id]).id
    @favorite = Favorite.new(artist_id: @artist_id, user_id: @user_id)
    if @favorite.save
      redirect_to artists_path
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      redirect_to user_path(current_user)
    end
  end
end
