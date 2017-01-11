class ClipsController < ApplicationController
  def create


    @user_id = current_user.id
    @event_id = Event.find(params[:id]).id
    @clip = Clip.new(event_id: @event_id, user_id: @user_id)

    if @clip.save
      redirect_to clips_path(current_user)
    else
      redirect_to clips_path(current_user)
    end

  end

  def destroy
    @clip = Clip.find(params[:id])
    if @clip.destroy
      redirect_to clips_path(current_user)
    end
  end

  def index
    @user = current_user
    @clips = Clip.where(user_id: @user.id).all.order("created_at DESC").page(params[:page]).per(20)
  end

  def show_clips
    @event = Event.find(params[:id])
    @clips = Clip.where(event_id: @event.id).all.order("created_at DESC").page(params[:page]).per(20)
  end

end
