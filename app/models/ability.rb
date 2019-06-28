class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    user ||= User.new

    if user.is_admin?
      can :manage, Post
    end
    can :create, Comment
    can [:update, :destroy], Comment, user_id: user.id
  end
end
