class Restaurant < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :reviews

  validates_presence_of :zip_code, :name, :latitude, :longitude, :address
  
  scope :where_zip, -> (term) { where("restaurants.zip_code = ?", term)}
end
