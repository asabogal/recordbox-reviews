class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @record = Record.find(params[:record_id])
  end

  def edit
    @review = Review.find(params[:id])
    @record = Record.find(params[:record_id])
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
    @review = Review.find(params[:id])
      @review.update(review_params)
      if @review.save
        redirecto_to @review.record
      else
        render :edit
      end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to record_path(@review.record)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :favorite_track, :record_id)
  end

end
