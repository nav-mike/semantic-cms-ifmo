# User ability model
# @author M. Navrotskiy m.navrotskiy
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :pages
    end
  end
end
