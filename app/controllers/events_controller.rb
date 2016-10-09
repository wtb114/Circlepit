class EventsController < ApplicationController

  def index
    @events = Event.all.order("event_date DESC").page(params[:page]).per(5)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_params)
    redirect_to events_path
  end

  def destroy
    @event = Artist.find(params[:id])
    @event.destroy if @event.user_id == current_user.id
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params) if event.user_id == current_user.id
     redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:event_date).merge(event_name: params[:event_name], event_location: params[:event_location], user_id: current_user.id)
  end

end
