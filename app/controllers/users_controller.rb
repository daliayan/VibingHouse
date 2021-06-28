class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
          redirect_to @user
        else
          render :error
        end
    end

    def show
        logged_in?
        @user = User.find(params[:id])
        redirect_to root_path if !@user
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
    

end