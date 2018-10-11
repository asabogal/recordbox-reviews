class Record < ApplicationRecord
  belongs_to :user, optional: :true
  has_many :reviews
  has_many :tracks, dependent: :destroy
  accepts_nested_attributes_for :tracks, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
  has_one_attached :image

  validates :artist, presence: true
  validates :title, presence: true
  validates :label, presence: true
  validates :format, presence: true
  validates :cat, presence: true
  # validates :released, presence: true
  validates :genre, presence: true
  validates :tracks, presence: true


  def review_avg
    self.reviews.average(:rating).to_i
  end

  scope :rating_down, ->{ order("avg_review DESC")}

end
