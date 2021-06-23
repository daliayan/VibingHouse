class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            create_session
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