class UserController < ApplicationController
  before_action :require_user_signed_in
  
  def calendar
    @user = User.find(Current.user.id)
  end

  def profile
    @user = User.find(Current.user.id)
  end

  def change_user_details
    # Check if there is a user - can't hurt!
    require_user_signed_in

    @user = User.find(Current.user.id)
    # Check to see if the form was submitted with a first and last name
    if params[:first_name]
      @user.first_name = params[:first_name]
    end
    if params[:last_name]
      @user.last_name = params[:last_name]
    end
    if @user.save
    end
    redirect_to user_calendar_path
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: "Succesfully logged out!"
  end
end

