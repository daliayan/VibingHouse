class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:username][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :error
        end
    end

    
end