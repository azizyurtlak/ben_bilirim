class Admin::BaseController < ApplicationController
  before_action :check_admin

  def check_admin
    if !session[:user_id]
      return redirect_to '/'
    end

    user = User.find(session[:user_id])

    if !user.is_admin
      redirect_to '/'
    end
  end
end
