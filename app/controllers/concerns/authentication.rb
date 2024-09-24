# app/controllers/concerns/authentication.rb
module Authentication
    extend ActiveSupport::Concern
  
    included do
      before_action :authenticate_user
      helper_method :current_user
    end
  
    private
  
    def authenticate_user
      unless current_user || request.path == signup_path || request.path == login_path || request.path == logout_path || request.path == users_path
        flash[:notice] = "Please sign in to continue."
        redirect_to login_path
      end
    end
    
    
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end
  