class HomeController < ApplicationController
  def show
    if session[:user_id]
      redirect_to '/start'
    end
  end
end
