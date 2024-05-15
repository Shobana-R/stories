class CommentsController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.build(comment_params)
    @comment.parent_comment_id = params[:comment][:parent_comment_id]
    
    if @comment.save
      redirect_to @story
    else
      redirect_to @story, alert: 'Comment could not be posted.'
    end
  end

  def new_reply
    @story = Story.find(params[:story_id])
    @parent_comment = Comment.find(params[:id])
    @comment = @story.comments.new(parent_comment_id: @parent_comment.id)

    respond_to do |format|
      format.html # renders new_reply.html.erb
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_name, :parent_comment_id)
  end
end
