class Review < ApplicationRecord
  belongs_to :reviewer, class_name: :User, foreign_key: :user_id, optional: :true
  belongs_to :record, optional: :true
  validates :rating, length: { maximum: 5 }
  validates :comment, length: { maximum: 150 }
end
