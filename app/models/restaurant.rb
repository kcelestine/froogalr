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
    rating_hash = { 
      5 => "Totally Torth It!",
      4 => "Pretty Worth It",
      3 => "Kinda Worth It",
      2 => "Not Worth It", 
      1 => "Meh!" }

    return rating_hash[rating]
  end
end
