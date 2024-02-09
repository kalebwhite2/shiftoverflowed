class ApplicationController < ActionController::Base
    # Before any methods, set the current user (first thing that happens)
    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    # If the session[:user_id] doesn't exist, then Current.user is nil
    def require_user_signed_in
        redirect_to root_path, alert: "You must be signed in to do that " if Current.user.nil?
    end

    def check_user_signed_in
        redirect_to user_calendar_path if Current.user
    end
end
