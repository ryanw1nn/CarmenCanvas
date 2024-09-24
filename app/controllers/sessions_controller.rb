class SessionsController < ApplicationController
    skip_before_action :authenticate_user, only: [:new, :create]
    
    def new
      #render login form
      @user = User.new
    end

    def create
        user = User.find_by(name: params[:name])
        puts "User authentication attempt: #{user.inspect}"
        if user && user.authenticate(params[:password])
            puts "User authentication success"
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successfully"
        else
            flash[:error] = "Invalid username or password. Please try again."
            render :new
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to login_path, notice: "You have been logged out successfully."
    end
end
