# Base controller class for angular routes
# @author M. Navrotskiy m.navrotskiy@gmail.com
class LayoutsController < AdminController
  def index
    render layout: layout_name
  end

  def layout_name
    if params[:layout] == 0
      false
    else
      'admin'
    end
  end
end
