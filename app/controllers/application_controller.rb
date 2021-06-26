class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    private 

    def require_login
      redirect_to login_path unless session[:user_id]    
    end

    def current_user
        session[:user_id]
    end

    def logged_in?
        !!current_user
    end
end
