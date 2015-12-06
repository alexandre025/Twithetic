class Ability
  include CanCan::Ability

  def initialize(current_user)

    current_user ||= User.new

    can [:create,:read], Post
    can [:update,:destroy], Post, user_id: current_user.id

    can [:create,:read], Comment
    can [:destroy], Comment, user_id: current_user.id

    can [:create,:read], User
    can [:update,:destroy], User, id: current_user.id

  end
end
