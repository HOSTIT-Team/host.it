class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_invitation, only: [:update, :destroy]
  before_action :find_event, only: [:index, :create, :update, :destroy]

  def index
    @invitations = Invitation.where(event: @event)
  end

  def update
    authorize @invitation
    @invitation.status = params[:status]
    if @invitation.save
      render "dashboard/index"
      flash.alert = "Invitation status changed"
    else
      render "dashboard/index"
      flash.alert = "Error changing invitation status"
    end
  end

  def create
    @invitation = Invitation.new(strong_params)
    authorize @invitation
    @invitation.sender = current_user
    @invitation.event = @event
    @invited_already = Invitation.find_by(receiver_email: @invitation.receiver_email)
    if @invited_already
      redirect_to event_path(@event)
      flash.alert = "Invitation failed: Guest already invited"
    else
      if @invitation.save
        redirect_to event_path(@event)
        flash.alert = "Invitation sent"
      else
        redirect_to event_path(@event)
        flash.alert = "Invitation failed"
      end
    end
  end

  private

  def find_invitation
    @invitation = Invitation.find(params[:id])
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def strong_params
    params.require(:invitation).permit(:status, :receiver_email)
  end
end
