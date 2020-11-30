class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_invitation, only: [:update, :destroy]
  before_action :find_event, only: [:index, :create, :destroy]

  def index
    @invitations = Invitation.where(event: @event)
  end

  def update
    authorize @invitation
    @invitation.status = params[:status]
    if @invitation.save
      redirect_to dashboard_index_path
      flash.alert = "Invitation status changed"
    else
      redirect_to dashboard_path
      flash.alert = "Error changing invitation status"
    end
  end

  def create
    @invitation = Invitation.new(strong_params)
    authorize @invitation
    @invitation.sender = current_user
    @invitation.event = @event
    @invitation.receiver = User.find_by(email: @invitation.receiver_email)
    @invited_already = Invitation.where(event: @event).find_by(receiver_email: @invitation.receiver_email)
    if @invited_already
      redirect_to event_path(@event)
      flash.alert = "Invitation failed: Guest already invited"
    elsif @invitation.receiver_email == current_user.email
      redirect_to event_path(@event)
      flash.alert = "Invitation failed: You can't invite yourself"
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

  def destroy
    @invitation = Invitation.find(params[:id])
    if @invitation.destroy
      redirect_to event_path(@event)
      flash.alert = "Invitation deleted"
    else
      redirect_to event_path(@event)
      flash.alert = "Invitation deletion failed"
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
