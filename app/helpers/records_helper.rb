module RecordsHelper

  def review_owner
    @record.reviews.find {|r| r.reviewer == current_user}
  end


end
