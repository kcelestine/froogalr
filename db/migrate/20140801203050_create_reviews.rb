class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text       :comment
      t.integer    :worth_it
      t.references :user_id
      t.references :restaurant_id
      t.timestamps
    end
  end
end
