class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:user][:username])
    # binding.pry
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
            # binding.pry
        else
            # binding.pry
            render :error
            # binding.pry
        end
    end

    def destroy
        session.clear
        redirect_to root_path, notice: 'Logged out!'  
    end
    
end