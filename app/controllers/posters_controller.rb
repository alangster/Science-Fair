class PostersController < ApplicationController

  def index
    @posters = Poster.all
  end

  def show
    @poster = Poster.find(params[:poster_id])
    @comments = @poster.comments
  end

end
