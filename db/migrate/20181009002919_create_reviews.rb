class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.string :favorite_track
      t.integer :user_id
      t.integer :record_id

      t.timestamps
    end
  end
end
