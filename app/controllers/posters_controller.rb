class PostersController < ApplicationController
  def index
    @posters = Poster.all
  end

  def show
    @poster = Poster.find(params[:poster_id])
    @comments = @poster.comments
  end

  def new
     unless current_user
      redirect_to "posters/index"
    end
    @poster = Poster.new
  end

  def create
    @poster = Poster.new(poster_params)
    @poster.creator = current_user
      if @poster.save
        redirect_to @poster
      else
        @error = "The poster was not created"
        #render error
      end
  end
  private

  def poster_params
    params.require(:poster).permit(:title, :abstract, :filepath)
  end
end
