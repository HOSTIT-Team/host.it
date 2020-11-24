class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(strong_params)
    @event.user = current_user
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def find_event

  end

  def strong_params
    params.require[:event].permit[:title, :location, :time, :description]
  end
end
