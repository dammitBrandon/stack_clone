class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find_by_id(params[:id])
    @answers = Answer.find_by_question_id(params[:id])
  end

  def edit 
  end

  def new
  end

  def create
  end

  def destroy
  end
  
  def update
  end

end
