# Public users controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class UsersController < AuthenticateController
  layout 'admin'

  def index
    @users_grid = initialize_grid(User)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
