class Review < ApplicationRecord
  belongs_to :user
  belongs_to :record
  validates :rating, length: { maximum: 5 }
  validates :comment, length: { maximum: 150 }
end
