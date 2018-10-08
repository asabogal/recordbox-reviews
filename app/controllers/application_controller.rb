class ApplicationController < ActionController::Base
  helper_method :login!, :logged_in?, :current_user, :require_login, :authorized_user?, :logout!

  def login!
    session[:user_id] = @user.id
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    flash[:message] = "Please login to do that"
    redirect_to '/login' if !logged_in?
  end

  def authorized_user?
     @user == current_user
   end

   def logout!
     session.clear
   end

end
