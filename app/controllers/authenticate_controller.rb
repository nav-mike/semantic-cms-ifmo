# Base authentication controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class AuthenticateController < ApplicationController
  # devise
  before_action :authenticate_user!
end
