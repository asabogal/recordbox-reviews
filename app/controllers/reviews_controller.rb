class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @record = Record.find(params[:record_id])
  end

  def edit
  end



  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.record = Record.find(params[:record_id])
    if @review.save
      redirect_to record_path(@review.record)
    else
      flash.now[:message] = "Error. Please try again!"
      render :new
    end
  end

  def update
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :favorite_track, :record_id)
  end

end
