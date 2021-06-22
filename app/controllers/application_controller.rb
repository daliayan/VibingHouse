class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    private 
    def current_user
        @current_user ||= User.find_by_id(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end
  
    def not_logged_in
      if !logged_in?         
        redirect '/login'
      end 
    end
end
