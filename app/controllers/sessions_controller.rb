class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: session_params[:email])
      if @user && @user.authenticate(session_params[:password])
        login!
        redirect_to user_path(@user)
      else
        flash[:message] = "Wrong credentials. Please try again"
        redirect_to '/login'
      end
  end

  def destroy
    logout!
    redirect_to '/'
  end

  private

    def session_params
      params.require(:user).permit(:username, :email, :password, :uid)
    end

end
