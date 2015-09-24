# Admin controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class AdminController < AuthenticateController
  layout 'admin', only: [:index]

  def index
  end

  def project
  end

  def person
  end
end
