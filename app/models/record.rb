class Record < ApplicationRecord
  belongs_to :user, optional: :true
  has_many :reviews
  has_many :tracks
  acceptes_nested_attributes_for :tracks


end
