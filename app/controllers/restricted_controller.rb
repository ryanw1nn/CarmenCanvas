# app/controllers/restricted_controller.rb
class RestrictedController < ApplicationController
    before_action :require_login
  
    def index
      # Display content accessible only to logged-in users
    end
  
    private
  
    def require_login
      unless current_user
        flash[:notice] = "Please sign up or log in to access this page."
        redirect_to signup_path
      end
    end
  end
  