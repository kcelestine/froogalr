class AddFactualIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :factual_id, :string
  end
end
