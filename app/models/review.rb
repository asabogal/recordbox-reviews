class Review < ApplicationRecord
  belongs_to :user, optional: :true
  belongs_to :record, optional: :true
  validates :rating, length: { maximum: 5 }
  validates :comment, length: { maximum: 150 }
end
