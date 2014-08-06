class Ability
  include CanCan::Ability

  def initialize(user)
    
    can :create, Review do |review|
      if user.reviews.include?(review.id) == false 
      end
    end

    can :update, Review do |review|
        user == review.user
    end

    can :destroy, Review do |review|
        user == review.user
    end

  end
end
