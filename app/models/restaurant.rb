class Restaurant < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :reviews
  scope :where_zip, -> (term) { where("restaurants.zip_code = ?", term)}
end
