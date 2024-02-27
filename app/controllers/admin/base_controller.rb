class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :require_user_signed_in
end