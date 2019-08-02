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

  def to_list
    rules.map do |rule|
      object = { actions: rule.actions, subject: rule.subjects.map{ |s| s.is_a?(Symbol) ? s : s.name } }
      object[:conditions] = rule.conditions unless rule.conditions.blank?
      object[:inverted] = true unless rule.base_behavior
      object
    end
  end
end
