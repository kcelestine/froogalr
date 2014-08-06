class AddSeamlessAndYelpToResaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :seamless, :string
    add_column :restaurants, :yelp, :string
  end
end
