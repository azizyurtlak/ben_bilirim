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
    session[:question_id] = @question.id
  end

  def answer
    question = Question.find(session[:question_id])
    question_number = session[:question_number]
    if question.correct_answer == params[:answer_index].to_i
      if question_number == 15
        render :congrats
      else
        session[:question_number] = question_number + 1
        redirect_to '/play'
      end
    else
      redirect_to '/fails'
    end
  end

  def fails
  end
end
