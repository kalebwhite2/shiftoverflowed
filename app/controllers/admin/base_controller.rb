class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :require_user_signed_in, :require_user_admin

  private
  def require_user_admin
    redirect_to user_calendar_path if Current.user.type != "SiteAdmin" 
  end
end