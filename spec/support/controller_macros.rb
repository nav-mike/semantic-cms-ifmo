# Macros for authenticate user for controllers specs
# @author M. Navrotskiy m.navrotskiy@gmail.com
module ControllerMacros
  def login_user
    before :each do
      user = FactoryGirl.create :user
      sign_in user
    end
  end
end
