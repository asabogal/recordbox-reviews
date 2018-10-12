class UsersController < ApplicationController
  before_action :find_user, only: [:show, :recordbox, :reviewed_records]
  before_action :require_login, except: [:new, :create]

  def index
    @users = User.all
  end

  def new
    if !logged_in?
      @user = User.new
    else
      flash[:message] = "You already have an account and are logged in."
      redirect_to user_path(current_user)
    end
  end

  def show
  end

  def recordbox
    @records = @user.records
  end

  def reviewed_records
    @records = @user.reviewed_records
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
