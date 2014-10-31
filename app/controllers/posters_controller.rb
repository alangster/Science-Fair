class PostersController < ApplicationController

  def index
    @posters = Poster.all
  end

  def show
    @poster = Poster.find(params[:id])
    @comments = @poster.comments
  end

end
