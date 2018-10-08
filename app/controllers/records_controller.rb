class RecordsController < ApplicationController

  def index
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
  end

  def edit
  end

  #post/patch
  #----

  def create
    @record = Record.new(record_params.except(params[:record][:track_name]))

      # @track = Track.new(name: params[:record][:track_name])
      @record.tracks.build(name: params[:record][:track_name])
      @record.save
      redirect_to record_path(@record)
  end

  # def create
  #   @record = Record.new
  #   if params[:record][:track_name].present?
  #     # @track = Track.new(name: params[:record][:track_name])
  #     @track = @record.tracks.build(name: params[:record][:track_name])
  #     @record.tracks << @track
  #     @record.save
  #     @record.reload
  #     flash[:message] = "Add another track?"
  #     render :new
  #   else
  #     @record.save
  #     redirect_to record_path(@record)
  #   end
  # end

  def update
  end

  def destroy
  end


  private

  def record_params
    params.require(:record).permit(:artist, :title, :label, :format, :cat, :release, :genre, :track_name, :user_id)
  end

end
