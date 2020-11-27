class ItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_event, only: [:index, :new]
    def index
        @items = policy_scope(Item).where(event: @event)

    end
        
    def new
        @item = Item.create(name:"bouffe",event:@event, user:current_user)
        authorize @event
        authorize @item
        
    end
    private

    def find_event
        @event = Event.find(params[:event_id])
    end   


end