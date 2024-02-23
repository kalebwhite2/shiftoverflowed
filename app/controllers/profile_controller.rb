class ProfileController < UserController
    def profile
        find_user
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
  
end