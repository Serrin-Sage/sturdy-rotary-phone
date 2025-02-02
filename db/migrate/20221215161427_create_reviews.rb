class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :star_rating, default: 0
      t.integer :restaurant_id
      t.integer :customer_id
    end
  end
end
