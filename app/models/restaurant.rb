class Restaurant < ActiveRecord::Base
  has_and_belongs_to_many :users
  scope :where_zip, -> (term) { where("restaurants.zip_code = ?", term)}
end
