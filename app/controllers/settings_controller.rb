# Settings pages controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class SettingsController < AuthenticateController
  layout 'admin'

  def index
    @settings_grid = initialize_grid(Setting)
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
