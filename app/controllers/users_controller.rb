class UsersController < ApplicationController
  before_action :find_user, only: [:show, :recordbox]

  def index
  end

  def new
    if !logged_in?
      @user = User.new
    else
      flash[:message] = "You already have an account"
      redirect_to user_path(current_user)
    end
  end

  def show
    if authorized_user?
      render :show
    else
      flash[:message] = "You don't have permision to do that!"
      redirect_to '/'
    end
  end

  def recordbox
    @records = @user.records
    if logged_in?
      if authorized_user?
        render :recordbox
      else
        redirect_to '/'
      end
    else
      flash[:message] = "Please log in to do that"
      redirect_to "/login"
    end

  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!
      redirect_to user_path(@user)
    else
      flash.now[:message] = "<strong>Please try again. There were some errors:</strong><br>".html_safe + @user.errors.full_messages.join("<br/>").html_safe
      render :new
    end
  end


  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end


end
