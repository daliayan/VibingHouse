class SessionsController < ApplicationController

    def new
        user = User.new
    end

    def create
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:current_user] = user.id
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