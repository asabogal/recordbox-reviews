class RecordsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  #post/patch

  def create
  end

  def update
  end

  def destroy
  end


  private

  def record_params
    params.require(:record).permit(:artist, :title, :label, :format, :cat, :release, :genre, :user_id)
  end

end
