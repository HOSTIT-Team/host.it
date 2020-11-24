class DashboardController < ApplicationController
  # def index
  #   @invitations = Invitation.where(sender_id: current_user.id).or(Invitation.where(receiver_id: current_user.id)))
  # end

  def index
    @events_as_host = policy_scope(Event).where(user: current_user).order(time: :desc)
    @events_as_guest = policy_scope(Invitation).where(receiver_id: current_user).order(time: :desc)
    # @host = current_user.events.any?
  end
end
