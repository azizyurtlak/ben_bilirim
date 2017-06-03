class ContestsController < ApplicationController
  def start
    if session[:user_id]
    else
      redirect_to new_session_path
    end 
  end
end
