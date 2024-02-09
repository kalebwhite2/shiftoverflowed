class ApplicationController < ActionController::Base
    # Before any methods, set the current user (first thing that happens)
    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end
end
