# Roles model
# @author M. Navrotskiy m.navrotskiy@gmail.com
class Role < ActiveRecord::Base
  has_many :users, through: :users_roles
  belongs_to :resource, polymorphic: true

  validates :resource_type,
            inclusion: {in: Rolify.resource_types},
            allow_nil: true
  scopify
end
