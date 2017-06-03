class ContestsController < ApplicationController
  def start
    if session[:user_id]
      session[:question_number] = 1
    else
      redirect_to new_session_path
    end
  end

  def play
    @question_number = session[:question_number]
    @question = Question.order("RANDOM()").first
  end

  def answer
    
  end
end
