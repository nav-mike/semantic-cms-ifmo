# Admin controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class AdminController < ApplicationController
  layout 'admin', only: [:index]

  def index
  end
end
