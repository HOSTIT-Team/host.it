class DashboardController < ApplicationController
  def index
    @events_as_host = policy_scope(Event).where(user: current_user)
    @invitations_as_guest = policy_scope(Invitation).where(receiver_id: current_user).includes(:event)

    @all_events = []
    @invitations_as_guest.each do |invitation|
      @all_events << invitation.event
    end
    @events_as_host.each do |event|
      @all_events << event
    end

    @all_events_sorted = @all_events.sort_by { |event| event.scheduled_at }

    @created_ats = @all_events_sorted.group_by { |date| date.scheduled_at.to_date }

    # raise
  end
end
