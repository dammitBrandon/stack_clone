class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    current_user
  end

  def show
    @question = Question.find(params[:id])

    @answers = Answer.find_all_by_question_id(params[:id])

    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(params[:question])
    if @question.save
      redirect_to question_path(@question)
    else
      @errors = @question.errors
      render new_question_path
    end
  end

  def destroy
    Question.destroy(params[:id])
    redirect_to questions_path
  end

  def update
    @question = Question.find_by_id(params[:id])
    @question.update_attributes(params[:question])
    redirect_to question_path(@question)
  end

end
