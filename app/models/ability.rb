class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new 
      if user.present?
      # User
      can :manage, User, id: user.id

    end
    if user.admin?
         can :manage, :all
    #  elsif user.member 
     #    can :read, :all
      #   can :read, Product
       #   can [:update, :destroy,:read], OrderItem
        #else
         # can :read, :all
        end

  end


end
