class LoginController < ApplicationController
  def new
    check_user_signed_in
    @user = User.new 
    @tab = 0 
  end

  def sign_up
    @user = User.new(user_params)
    if @user.save
      # Session - cookies, but encrypted!
      session[:user_id] = @user.id
      redirect_to user_calendar_path, notice: "Succesfully signed up!"
    else
      @tab = 1 
      render :new
    end
  end

  def sign_in
    # Find the user by email
    user = User.find_by(email: params[:email])
    # Does a user with that email exist and is their password valid?
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_calendar_path, notice: "Logged in succesfully!"
    else
      # Since we are redirecting and not rerendering the template, 
      # the values of the form fields will not be saved. So we have 
      # to return them as params. This will go to the url /?signup_email=params[:email]
      redirect_to root_path(@user, signup_email: params[:email]), notice: "Incorrect email or password"
    end
  end

  def reset_password
  end

  def update_password
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
