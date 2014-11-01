class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.create!(comment_params)
    # if @comment.save
    #   p @comment
    #   @poster = Poster.find(@comment.commentable_id)
    #   redirect_to @poster
    # else
    #   @error = "The comment was not saved"
    #   @errors = @poster.errors.messages
      # redirect_to @poster
    # end
  end


  def comment_params
    params.require(:comment).permit(:text, :user_id, :points, :commentable_id, :commentable_type)
  end

  def add_point
    comment = Comment.find_by(id: params[:comment_id])
    comment.increment!(:points)
    @points = comment.points
    render json: @points, status: 200
  end
end
