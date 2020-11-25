class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update]

    def show
        @user = current_user
         authorize @user
    end

    def edit
        authorize @user

    end
    
    def update
    
       authorize @user
        if @user.update(user_params)
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
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :avatar)
    end
end
