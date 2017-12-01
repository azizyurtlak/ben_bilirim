class ContestsController < ApplicationController
  def start
    session[:half_joker] = true
    session[:pass_joker] = true
    session[:question_id] = nil

    if session[:user_id]
      session[:question_number] = 1
    else
      redirect_to new_session_path
    end
  end

  def play
    if params[:joker] == 'pass' && session[:pass_joker]
      session[:question_number] = session[:question_number] + 1
      session[:question_id] = nil
      session[:pass_joker] = false
    end

    @question_number = session[:question_number]
    @question = session[:question_id] ? Question.find(session[:question_id]) : Question.order("RANDOM()").first
    session[:question_id] = @question.id

    if params[:joker] == 'half' && session[:half_joker]
      @wrong_answers = ([0, 1, 2, 3] - [@question.correct_answer]).sample(2)
      session[:half_joker] = false
    end
  end

  def answer
    question = Question.find(session[:question_id])
    session[:question_id] = nil
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
