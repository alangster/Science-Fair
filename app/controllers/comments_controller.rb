class CommentsController < ApplicationController
  def add_point
    comment = Comment.find_by(id: params[:comment_id])
    comment.increment!(:points)
    @points = comment.points
    render json: @points, status: 200
  end
end
