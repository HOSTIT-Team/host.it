class ItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_event, only: [:index, :create]
    def index
        @items = policy_scope(Item).where(event: @event)

    end
        
    def update
        @item =Item.find(params[:id])
        @event = @item.event
        authorize @item
        @item.user = current_user
        @item.save
        redirect_to event_path(@event, anchor: "items-anchor")
        # redirect_to event_path(@event, anchor: "items-#{@item.id}")

    end
    def create
       @item =Item.new(item_params)
        authorize @item
        @item.event = @event
        if @item.save
            redirect_to event_path(@event, anchor: "items-anchor")
            # render template:"shared/items_form", id:"items-anchor"  
        else 
          render "events/show"
       end
    end

    private
    
    def item_params
        params.require(:item).permit(:name)
    end
    def find_event
        @event = Event.find(params[:event_id])
    end   


end