class UserController < ApplicationController
  def calendar
    if Current.user 
      @user = User.find(Current.user.id)
    end
  end

  def profile
    if Current.user 
      @user = User.find(Current.user.id)
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: "Succesfully logged out!"
  end
end

