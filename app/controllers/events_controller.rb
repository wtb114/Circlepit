class EventsController < ApplicationController

  def index
    @search = Event.search(params[:q])
    @events = @search.result.order("event_date ASC").page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.json { render json: @events }
    end
  end

  def show
    @event = Event.find(params[:id])
    @clips = Clip.where(event_id: @event.id).all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      render :create
    else
      render "common/error_event"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy if @event.user_id == current_user.id
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params) if @event.user_id == current_user.id
    if @event.save
      render :update
    else
      render :edit
    end
  end

  private
  def event_params
    params.require(:event).permit(:event_date,:artist_id,:artist_id2,:artist_id3,:artist_id4,:artist_id5,:artist_id6,:artist_id7,:artist_id8,:artist_id9,:artist_id10).merge(event_name: params[:event_name], event_location: params[:event_location], user_id: current_user.id)
  end

end
