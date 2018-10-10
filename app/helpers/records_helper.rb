module RecordsHelper

  def review_owner
    @record.reviews.find {|r| r.user == current_user}
  end
end
