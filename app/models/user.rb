# User of cms
# @author M. Navrotskiy m.navrotskiy@gmail.com
class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :add_default_role

  def add_default_role
    add_role :admin
  end
end
