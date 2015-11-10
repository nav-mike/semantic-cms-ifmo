# Public users controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class UsersController < AuthenticateController
  layout 'admin'

  before_action :set_user, only: %i(show update destroy)

  def index
    @users = User.all
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

  def update
    if @user.update(user_params)
      render json: true, status: :ok
    else
      logger.error @user.errors.messages.to_s
      render json: {message: @user.errors.messages}, status: :internal_server_error
    end
  end

  def destroy
    @user.destroy
    render json: {message: 'User was successfully destroyed.'}, status: :ok
  rescue => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
    render json: {message: e.message}, status: :internal_server_error
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    params.require(:user).permit(:email, :password)
  end
end
