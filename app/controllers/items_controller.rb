class ItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_event, only: [:index, :new, :create]
    def index
        @items = policy_scope(Item).where(event: @event)

    end
        
    def new
        @item = Item.new
        authorize @item
        
    end

    def update
        @item =Item.find(params[:event_id])
        authorize @item
        @item.user = current_user
        @item.save
        redirect_to event_path(@event, anchor: "items-anchor")
    end
    def create
       @item =Item.new(item_params)
        authorize @item
        @item.event = @event
        if @item.save
            redirect_to event_path(@event, anchor: "items-anchor")
        else 
          render :new      
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