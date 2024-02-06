class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def login_page
  end
end
