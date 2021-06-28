class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    private 

    def require_login
      redirect_to login_path unless session[:user_id]    
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
        #session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def if_not_logged_in
        redirect_to root_path if !logged_in?
    end
end