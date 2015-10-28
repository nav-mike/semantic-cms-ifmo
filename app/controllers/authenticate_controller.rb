# Base authentication controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class AuthenticateController < ApplicationController
  # devise
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    '/!admin/pages'
  end
end
