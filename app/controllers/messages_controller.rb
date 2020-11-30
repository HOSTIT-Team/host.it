class MessagesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    message = Message.new(strong_params)
    message.chatroom = @event.chatroom
    message.user = current_user
    @invitation = Invitation.new
    @invitations = @event.invitations
    authorize message
    if message.save
      redirect_to event_path(@event, anchor: "event-chat")
      flash.alert = "Message sent."
    else 
      render "events/show"
      flash.alert = "Error: Message could not be sent."
    end
  end

  def destroy
    message =  Message.find(params[:id])
    message.destroy
  end

  def strong_params
    params.require(:message).permit(:content)
  end
end
