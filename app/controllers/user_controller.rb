class UserController < ApplicationController
    before_action :require_user_signed_in

    def logout
		session[:user_id] = nil
		flash[:notice] = "Succesfully logged out!"
		redirect_to root_path
    end

	protected
    def find_user
		@user = User.find(Current.user.id)
    end
end

