class Restaurant < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :reviews
  validates_presence_of :zip_code, :name, :latitude, :longitude, :address
  scope :where_zip, -> (term) { where("restaurants.zip_code = ?", term)}

  #gets all of restaurant instance's reviews and averages rating 
  def average_worth_it()
    self.reviews.average(:worth_it).round
  end

  #returns string for particular rating
  def worth_it_rating(rating)
    case rating
    when 5
      return "Totally Worth it!"
    when 4
      return "Pretty Worth it"
    when 3
      return "Kinda Worth it"
    when 2
      return "Not Worth it"
    when 1
      return "Meh!"
    end
  end 
end
