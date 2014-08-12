class Review < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :restaurants
  validates_presence_of :comment, :worth_it, :user_id, :restaurant_id
end
