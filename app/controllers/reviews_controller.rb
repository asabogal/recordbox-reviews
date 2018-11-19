class ReviewsController < ApplicationController
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :require_login

  def new
    @review = Review.new
    @record = Record.find(params[:record_id])
  end

  def edit
    @record = Record.find(params[:record_id])
  end


#--------
  def create
    @review = Review.new(review_params)
    @review.reviewer = current_user
    @review.record = Record.find(params[:record_id])
    if @review.save
      add_average_review
      redirect_to record_path(@review.record)
    else
      flash.now[:message] = "Error. Please try again!"
      render :new
    end
  end

  def update
      @review.update(review_params)
      if @review.save
        add_average_review
        redirect_to @review.record
      else
        render :edit
      end
  end

  def destroy
    @review.destroy
    redirect_to record_path(@review.record)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :favorite_track, :record_id)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def add_average_review
    @review.record.avg_review = @review.record.review_avg
    @review.record.save
  end

end
