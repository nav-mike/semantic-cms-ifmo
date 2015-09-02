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
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url, notice: 'User was successfully created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def user_params
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    params.require(:user).permit(:email, :password)
  end
end
