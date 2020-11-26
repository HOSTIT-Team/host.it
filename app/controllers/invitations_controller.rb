class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_invitation, only: [:update]

  def update
    authorize @invitation
    @invitation.status = params[:status]
    @invitation.save
    redirect_to dashboard_index_path
  end

  private

  def find_invitation
    @invitation = Invitation.find(params[:id])
  end

  def strong_params
    params.require(:invitation).permit(:status)
  end
end
