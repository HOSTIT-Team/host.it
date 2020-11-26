class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_invitation, only: [:accept, :decline]

  def accept
    @invitation.status = "Accepted"
    if @invitation.save
      redirect_to dashboard_index_path
    else
      redirect_to dashboard_index_path
      flash.alert = "Invitation could not be accepted"
    end
  end

  private

  def find_invitation
    @invitation = Invitation.find(params[:id])
  end

  def strong_params
    params.require(:invitation).permit(:status)
  end
end
