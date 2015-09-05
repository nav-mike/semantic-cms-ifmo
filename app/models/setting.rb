# Setting of cms
# @author M. Navrotskiy m.navrotskiy@gmail.com
class Setting < ActiveRecord::Base
  def destroy
    return unless can_removed
    delete
  end
end
