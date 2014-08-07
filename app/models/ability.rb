class Ability
  include CanCan::Ability

  def initialize(user)
    
    can :create, Review

    can :update, Review do |review|
        user == review.user
    end

    can :destroy, Review do |review|
        user == review.user
    end
  end
  
end
