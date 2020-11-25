class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit]

    def show
        @user = current_user
         authorize @user
    end

    def edit
        authorize @user

    end
    def update
        if @user == current_user
        @user.update(user_params)
        redirect_to user_path(@user)
        end
    end
    def new
        @user = User.new
        authorize @user
    end
    
    private

    def find_user
        @user = User.find(params[:id])
    end
end
