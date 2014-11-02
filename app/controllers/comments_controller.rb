class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      render json: {text: @comment.text, user_id: "#{@comment.user.id}" ,name: @comment.user.name, points: 0, commented_on: @comment.get_user_responded_to}, status: 200
    else
      @error = "Comment unable to be posted"
      render json: @error, status: 422
    end
  end



  def comment_params
    params.require(:comment).permit(:text, :points, :commentable_id, :commentable_type)
  end

  def add_point
    comment = Comment.find_by(id: params[:comment_id])
    comment.increment!(:points)
    @points = comment.points
    render json: @points, status: 200
  end
end
