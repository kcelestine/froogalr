class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string  :name
      t.string  :address
      t.float   :latitude
      t.float   :longitude
      t.integer :zip_code
      t.string  :telephone
      t.string  :website
      t.string  :cuisine
      t.text    :hours
    end
  end
end
