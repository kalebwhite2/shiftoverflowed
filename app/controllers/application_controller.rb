class ApplicationController < ActionController::Base
  # Before any methods, set the current user (first thing that happens)
  before_action :set_current_user

  # Using a string specifies a specific layout, using a symbol allows
  # us to call a function to decide which layout to use
  layout :decide_layout

  # Using ActiveSupport class Current (thread independent), create global user variable
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
    if Current.user
      redirect_to Current.user.type === "SiteAdmin" ? admin_root_path : user_calendar_path
    end
  end

  def decide_layout
    if Current.user
      Current.user.type === "SiteAdmin" ? "admin" : "application"
    end
  end
end
