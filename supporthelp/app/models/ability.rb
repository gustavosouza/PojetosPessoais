class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new # guest user (not logged in)
     if user.is_attendant?
       can :attend, :all
     else
       can :read, :all, creator: user.id
     end
  end
end