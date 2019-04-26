class WelcomeController < ApplicationController

  def home
    @records = Record.rating_desc
    if !logged_in?
      flash[:message] = "please login to unlock all features"
    end
  end

end
