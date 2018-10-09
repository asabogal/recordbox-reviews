class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @record = Record.find(params[:record_id])
  end

  def edit
  end



  def create
  end

  def update
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :favorite_track, :record_id)
  end

end
