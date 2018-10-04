class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :artist
      t.string :title
      t.string :label
      t.string :format
      t.string :cat
      t.date :released
      t.string :genre
      t.integer :user_id

      t.timestamps
    end
  end
end
