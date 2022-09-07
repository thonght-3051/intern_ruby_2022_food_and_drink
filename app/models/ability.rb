# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize user
    can :read, Product
    can :read, Category
    can :read, Order, user_id: user.id if user.present?
    return unless user&.admin?

    can :manage, Product
    can :manage, Category
    can :manage, Order
  end
end
