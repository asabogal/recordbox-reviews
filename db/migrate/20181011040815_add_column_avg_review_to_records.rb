class AddColumnAvgReviewToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :avg_review, :integer, default: 0
  end
end
