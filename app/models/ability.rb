class Ability
  include CanCan::Ability

  # prawa gościa zawierają się w prawach użytkownika i admina
  # analogicznie użytkownika w admina
  def initialize(user)
    user ||= User.new

    #gość
    can :read, Post

    #admin
    if user.is_admin?
      can :manage, Post
      can [:index, :destroy], User
    end

    #użytkownik
    if user.id
      can :create, Comment
      can [:update, :destroy], Comment, user_id: user.id
      can [:edit, :update, :destroy], User, id: user.id
    end
  end
end
