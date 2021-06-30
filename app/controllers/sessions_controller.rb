class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render :error
        end
    end

    def omniauth
        user = User.find_or_create_by(uid: auth["iud"]) do |u|
            u.username = auth["info"]["username"]
            u.password = SecureRandom.hex(15)
        end

        # user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to root_path
        end
    end

    def destroy
        session.clear
        redirect_to login_path 
    end

    private

    def auth
        request.env["omniauth.auth"]
    end
    
end