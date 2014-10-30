class PostersController < ApplicationController
  def show
    # render :'posters/show'
    @poster = Poster.find(params[:poster_id])
    @comments = @poster.comments
  end
end
