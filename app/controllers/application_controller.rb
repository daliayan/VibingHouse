class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :create_session

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
  
    def not_logged_in
      if !logged_in?         
        root_path
      end 
    end

    # def create_session
    #   session[:user_id] = user.id
    # end
end
