class CommentsController < ApplicationController
  def new
    puts params[:question_id]
    if params[:question_id]
      @type = "Question"
      # @question_id = params[:question_id]
      @commentable_id = params[:question_id]
    else
      @type = "Answer"
      @commentable_id = params[:answer_id]
      # @answer_id = params[:answer_id]
    end

    @comment = Comment.new
    render partial: 'shared/comment_form'
  end
  
  def create
    @comment = Comment.new(text: params[:comment][:text], 
                           user_id: session[:id],
                           commentable_type: params[:comment][:commentable_type],
                           commentable_id: params[:comment][:commentable_id])
    @comment.save
    p @comment
    puts "This is comment.commentable: #{@comment.commentable}"
  
    @comment.commentable.is_a?(Question) ? (redirect_to @comment.commentable) : (redirect_to @comment.commentable.question) 
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy
    redirect_to :back 

  end

end
