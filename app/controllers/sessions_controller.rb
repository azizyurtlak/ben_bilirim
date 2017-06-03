class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:email], password: params[:password]).first
    if user
      session[:user_id] = user.id
      redirect_to '/start'
    else
      redirect_to new_session_path
    end
  end
end
