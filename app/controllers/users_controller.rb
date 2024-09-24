class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create

      # Initialize a new user with the extracted username and admin set to false
      @user = User.new(user_params)

      if @user.save
        redirect_to grading_view_path, notice: 'User was successfully created.'
      else
        flash.now[:error] = "Failed to create user. Check username and password"
        render :new
      end
      
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to grading_view_path, notice: 'User was successfully deleted.'
  end

  def update
    @user = User.find(params[:id])
  
    # Conditionally update admin status
    if user_params[:admin].present? && user_params[:admin] != @user.admin
      if @user.update(admin: user_params[:admin])
        # Respond with JavaScript to update the DOM
        respond_to do |format|
          format.js
        end
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "No changes made to admin status" }, status: :unprocessable_entity
    end
  end
    
  private

  def user_params
    params.require(:user).permit(:name, :admin, :password, :password_confirmation)
  end
end
  