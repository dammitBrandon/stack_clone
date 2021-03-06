class AnswersController < ApplicationController

  def index

  end

  def show

  end

  def edit
    @answer = Answer.find_by_id(params[:id])
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.new(params[:answer])
    if @answer.save
      redirect_to question_path(@answer.question.id)
    else
      @errors = @answer.errors.full_messages
      flash[:errors] = @errors
      redirect_to :back
    end
  end

  def destroy
    answer = Answer.find_by_id(params[:id])
    question = answer.question
    Answer.destroy(params[:id])
    redirect_to questions_path(@question)
  end

  def update
    @answer = Answer.find_by_id(params[:id])
    @answer.update_attributes(params[:answer])
    redirect_to question_path(@answer.question)
  end

end
