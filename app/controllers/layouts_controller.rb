# Base controller class for angular routes
# @author M. Navrotskiy m.navrotskiy@gmail.com
class LayoutsController < AdminController
  def index
    render layout: layout_name
  end

  def layout_name
    if params[:layout] == :null
      false
    elsif params[:layout] == :public
      'application'
    else
      'admin'
    end
  end
end
