# Admin controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class AdminController < AuthenticateController
  layout 'admin', only: [:index]

  def index
    redirect_to '/pages/index'
  end

  def project
  end

  def person
  end

  def department
  end

  def search
  end
end
