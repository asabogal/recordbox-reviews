class WelcomeController < ApplicationController

  def home
    @records = Record.rating_desc
  end

end
