class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id)#.order("created_at DESC").page(params[:page]).per(5)
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end


  private
  def update_params
    params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :avatar, :username)
  end

end
