# Settings pages controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class SettingsController < AuthenticateController
  layout 'admin'

  before_action :set_setting, only: %i(edit update destroy)

  def index
    @settings_grid = initialize_grid(Setting)
  end

  def new
  end

  def edit
  end

  def update
    if @setting.update(setting_params)
      redirect_to settings_url, notice: "#{@setting.key} was successfully updated"
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_setting
    @setting = Setting.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit(:key, :value)
  end
end
