class Record < ApplicationRecord
  belongs_to :user, optional: :true
  has_many :reviews
  has_many :tracks, dependent: :destroy
  accepts_nested_attributes_for :tracks, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }

  # def track_name(name)
  #    self.name = Track.find_or_create_by(name: name)
  #  end
  #
  #  # def track_name
  #  #   self.track ? self.track.name : nil
  #  # end
  #
  #  def track_name
  #    if !self.tracks.empty?
  #       self.tracks.last.name
  #    end
  #  end


end
