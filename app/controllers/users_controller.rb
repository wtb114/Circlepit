class UsersController < ApplicationController

  def index
    @search = User.search(params[:q])
    @users = @search.result.order("created_at DESC").page(params[:page]).per(20)

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.birthday?
    date_format = "%Y%m%d"
    @age = (Date.today.strftime(date_format).to_i - @user.birthday.strftime(date_format).to_i) / 10000
    end
    @favorites = Favorite.where(user_id: @user.id).limit(5).order("created_at DESC")
    @clips = Clip.where(user_id: @user.id).limit(5).order("event_date DESC")
    @tweets = Tweet.where(user_id: @user.id).limit(5).order("created_at DESC")
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end

  def following
    @title = "フォロー"
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  def users_tweets
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: @user.id).all.order("created_at DESC").page(params[:page]).per(20)
  end

  def users_comments
    @user = User.find(params[:id])
    @comments = Comment.where(user_id: @user.id).all.order("created_at DESC").page(params[:page]).per(20)
  end

  private
  def update_params
    params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :avatar, :username, :gender, :location, :hometown, :birthday, :comment)
  end

end
