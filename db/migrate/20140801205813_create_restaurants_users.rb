class CreateRestaurantsUsers < ActiveRecord::Migration
  def change
    create_table :restaurants_users, :id => false do |t|
      t.integer :restaurant_id
      t.integer :user_id
    end
  end
end
