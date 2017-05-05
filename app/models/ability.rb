class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
        can :manage, :all
    elsif user.role? :manager
        can :read, :all
        can :manager, User do |u|
            u.role == "employee" || u.id == user.id
        end
        can :manage, Item
        can :read, ItemPrice
        can :create, ItemPrice
        can :create, Purchase
    elsif user.role? :shipper
        can :manage, User do |u|
            u.id == user.id
        end
        can :update, Order
        can :read, Item
    elsif user.role? :customer
        can :manage, User do |u|
            u.id == user.id
        end
        can :destroy, Order do |o|
            o.user_id == user.id
        end
        can :create, Order
        can :read, Item
        can :manage, School do |s|
            s.user_id == user.id
        end
        can :create, School
        can :add_to_cart, Item
        can :remove_from_cart, Item
    else
        #guest
        can :read, Item
        can :create, User
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
