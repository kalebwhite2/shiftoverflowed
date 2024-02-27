class LoginController < ApplicationController
  before_action :check_user_signed_in

  def new
    create_local_user
  end

  def sign_up
    # Use invite code to see if user is a part of a team or an admin
    if params[:user][:invite_code] === 'super_secret_admin_code'
      @user = SiteAdmin.new(user_params)
    else
      @user = User.new(user_params)
    end
    
    # Persist the user
    if @user.save
      # Session - cookies, but encrypted!
      session[:user_id] = @user.id
      flash[:notice] = "Succesfully signed up!"
      redirect_to user_calendar_path
    else
      create_local_user(1, @user)
      render :new
    end
  end

  def sign_in
    # Find the user by email
    user = User.find_by(email: params[:email])
    # Does a user with that email exist and is their password valid?
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in succesfully!"
      if user.type === SiteAdmin
        redirect_to admin_root_path
      else 
        redirect_to user_calendar_path
      end
    else
      # We keep the value of the inputted email by saving it as an instance variable
      flash[:alert] = "Incorrect email or password"
      @sign_up_email = params[:email]
      create_local_user
      render :new
    end
  end

  def reset_password
    @user = User.find_by(email: params[:email])

    if @user.present?
      # Send email
      # TODO
    else 
      # Check to see if reset_password is called by the sign up page,
      # and thus if params[:email] exists
      if params[:email]
        flash.now[:alert] = "Email not found."
      end

      create_local_user(2)
      render :new 
    end
  end

  def update_password
  end

  private

  def user_params
    # Grab the invite_code from the array
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def create_local_user(tab=0, user=User.new)
    @user = user 
    @tab = tab 
  end
end
