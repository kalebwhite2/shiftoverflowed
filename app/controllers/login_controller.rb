class LoginController < ApplicationController
  def login_page
    @user = User.new
    @tab = 0 
  end

  def sign_up
    @user = User.new(user_params)
    if @user.save
      redirect_to user_calendar_path, notice: "Succesfully signed up!"
    else
      @tab = 1 
      render :login_page
    end
  end

  def sign_in
  end

  def reset_password
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
