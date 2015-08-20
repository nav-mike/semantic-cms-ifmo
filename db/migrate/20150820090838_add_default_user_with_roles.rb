# Migration which add admin user and admin role
# @author M. Navrotskiy m.navrotskiy@gmail.com
class AddDefaultUserWithRoles < ActiveRecord::Migration
  def change
    # admin user
    admin = User.create! email: 'admin@admin.com', password: '1234567890'

    # admin role
    Role.where(name: :admin).first_or_create!

    # add role to user
    admin.add_role :admin
  end
end
