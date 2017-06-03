class Admin::QuestionsController < ApplicationController
  def index
    if params[:query]
      @questions = Question.where('content like ?', "%#{params[:query]}%")
    else
      @questions = Question.all
    end
  end

  def new
    @question = Question.new
    @question.answers = []
  end

  def create
    @question = Question.new
    @question.content = params[:question][:content]
    @question.answers = params[:question][:answers]
    @question.correct_answer = params[:question][:correct_answer]
    @question.save
    redirect_to admin_questions_path

  end

  def edit
    @question = Question.find(params[:id])
    render :new
  end

  def update
    @question = Question.find(params[:id])
    @question.content = params[:question][:content]
    @question.answers = params[:question][:answers]
    @question.correct_answer = params[:question][:correct_answer]
    @question.save
    redirect_to admin_questions_path
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to admin_questions_path
  end
end
