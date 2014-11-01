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
    p params
    @poster = Poster.new(poster_params)
    @poster.creator = current_user
      if @poster.save
        credit_where_it_is_due(params)
        redirect_to @poster
      else
        @error = "The poster was not saved"
        @errors = @poster.errors.messages
        render "new"
        #render error
      end
  end

  private

  def poster_params
    params.require(:poster).permit(:title, :abstract, :filepath)
  end

  def credit_where_it_is_due(params)
    params.each do |key, value|
      if /email\d/.match(key) && value != ""
        UserPoster.create!(poster: @poster, user: User.find_by(email: value))
      end
    end
  end

end
