class PostersController < ApplicationController
  def index
    @posters = Poster.all
  end

  def show
    @poster = Poster.find(params[:id])
    @comments = @poster.comments
  end

  def new
    #  unless current_user
    #   render "posters"
    # end
    @poster = Poster.new
    @user = User.new
  end

  def create
    debugger
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
    params.require(:poster).permit(:title, :abstract, :filepath, user_attributes:[:email] )
  end
end
