class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  
  validates_presence_of :comment, :worth_it, :user_id, :restaurant_id
end
