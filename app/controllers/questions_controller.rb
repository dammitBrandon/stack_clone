class QuestionsController < ApplicationController

  def index
    @questions = Question.all#order("created_at DESC")
    current_user
  end

  def show
    @question = Question.find_by_id(params[:id])
    @answers = Answer.find_all_by_question_id(params[:id])
  end

  def edit
    @question = Question.find_by_id(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(params[:question])
    if @question.valid?
      @question.save
      redirect_to question_path(@question)
    else
      @errors = @question.errors.full_messages
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
