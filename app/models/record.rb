class Record < ApplicationRecord
  belongs_to :user, optional: :true
  has_many :reviews
  has_many :tracks, dependent: :destroy
  accepts_nested_attributes_for :tracks, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
end
