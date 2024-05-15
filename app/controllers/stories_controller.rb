class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
    @comment = Comment.new  # For new comment form
   # @comments = @story.comments.includes(:replies)  # Load comments with replies
  end
end
