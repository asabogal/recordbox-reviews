class RecordsController < ApplicationController
  before_action :find_record, only: [:show, :edit, :update, :destroy]

  def index
    @records = Record.all
  end

  def show
  end

  def new
    @record = Record.new
    @record.tracks.build
  end

  def edit
    if @record.user == current_user
    else
      flash.now[:message] = "You don't have permision to do that!"
      redirect_to '/'
    end
  end

  def rating_down
    @records = Record.rating_down
    render action: :index
  end

  #post/patch
  #----

  def create
    @record = Record.new(record_params)
    @record.user = current_user
      if @record.save
        redirect_to record_path(@record)
    else
      flash.now[:message] = "<strong>Please try again. There were some errors:</strong><br>".html_safe + @record.errors.full_messages.join("<br/>").html_safe
      render :new
    end
  end

  def update
    binding.pry
    if @record && @record.user == current_user
      @record.update(record_params)
        if @record.save
          redirect_to record_path(@record)
        else
          flash.now[:message] = "<strong>Please try again. There were some errors:</strong><br>".html_safe + @record.errors.full_messages.join("<br/>").html_safe
          render :edit
        end
    else
      flash[:message] = "Record not found or you don't have permission to do that"
      redirect_to '/'
    end
  end

  def destroy
    if @record.user == current_user
      @record.delete
      redirect_to user_recordbox_path(current_user)
    else
      flash.now[:message] = "You don't have permision to do that!"
      redirect_to '/'
    end
  end


  private

  def find_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:artist, :title, :label, :format, :cat, :released, :genre, :image, :user_id, tracks_attributes: Track.attribute_names.map(&:to_sym).push(:_destroy))
  end

end
