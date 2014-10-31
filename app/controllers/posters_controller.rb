class PostersController < ApplicationController

  def index
    @posters = Poster.all
  end

  def show
    @poster = Poster.find(params[:poster_id])
    @comments = @poster.comments
  end

  def new

    @poster = Poster.new
  end

  def create
    @poster = Poster.new(params[:poster])
    @poster.creator = current_user
      if @poster.save
        redirect_to @poster
      else
        @error = "The poster was not created"
      end
  end
end
