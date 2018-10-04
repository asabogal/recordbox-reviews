class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex
        end
      login!
      redirect_to user_path(@user)
    else
      @user = User.find_by(email: session_params[:email])
      if @user && @user.authenticate(session_params[:password])
          login!
          redirect_to user_path(@user)
      else
          flash[:message] = "No such user. Please try again."
          redirect_to '/login'
      end
    end
  end

  def destroy
    logout!
    redirect_to '/'
  end

  def auth
    request.env['omniauth.auth']
  end

  private

    def session_params
      params.require(:user).permit(:username, :email, :password, :uid)
    end



end
