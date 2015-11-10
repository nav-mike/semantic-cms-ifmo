# Public users controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class UsersController < AuthenticateController
  layout 'admin'

  before_action :set_user, only: %i(show edit update destroy)

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save!
    render json: true, status: :ok
  rescue => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
    render json: {message: e.message}, status: :internal_server_error
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      render json: true, status: :ok
    else
      byebug
      logger.error @user.errors.messages.to_s
      render json: {message: @user.errors.messages}, status: :internal_server_error
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # byebug
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    params.require(:user).permit(:email, :password)
  end
end
