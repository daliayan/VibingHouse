class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to @user
        else
          render :error
        end
    end

    def show
        @user = User.find(params[:current_user])
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
    

end