class UserController < ApplicationController
  def calendar
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: "Succesfully logged out!"
  end
end

