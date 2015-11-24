# Base controller class for angular routes
# @author M. Navrotskiy m.navrotskiy@gmail.com
class LayoutsController < AdminController
  def index
    if request.path == '/'
      redirect_to '/pages/index'
    else
      render layout: layout_name
    end
  end

  def layout_name
    if params[:layout] == :null
      false
    else
      'global'
    end
  end
end
