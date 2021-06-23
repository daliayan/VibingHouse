class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            @user = user 
            redirect_to user_path(user)
        else
            binding.pry
            render :error
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
    
end