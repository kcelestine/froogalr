class Ability
  include CanCan::Ability
  def initialize(user)
    #only logged in users can create reviews 
    can :create, Review

    #current user can only update reviews that belong to them
    can :update, Review do |review|
        user == review.user
    end

    #current user can only destroy reviews that belong to them 
    can :destroy, Review do |review|
        user == review.user
    end
  end 
end
