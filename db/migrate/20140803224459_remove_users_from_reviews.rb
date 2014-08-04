class RemoveUsersFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :user_id_id, :references
    remove_column :reviews, :restaurant_id_id, :references
  end
end
