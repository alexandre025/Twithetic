class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can [:create,:read], :post
    can [:update,:destroy], :post, user_id: user.id

    can [:create,:read], :comment
    can [:destroy], :comment, user_id: user.id

    can [:create,:read,:update], :user
    cannot :destroy, :user

  end
end
