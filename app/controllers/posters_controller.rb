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
    @poster = Poster.new(poster_params)
    @poster.creator = current_user
      if @poster.save
        @poster.credit_where_it_is_due(params)
        redirect_to @poster
      else
        @error = "The poster was not saved"
        @errors = @poster.errors.messages
        render "new"
      end
  end

  def edit
    @poster = Poster.find(params[:id])
    @author_emails = @poster.author_emails
  end

  def update
    p poster_params
    @poster = Poster.find(params[:id])
    @poster.filepath = nil
    @poster.update_attributes(poster_params)
    if @poster.save
      @poster.update_credit(params)
      redirect_to @poster
    else
      @author_emails = @poster.author_emails
      @error = "The poster was not saved"
      @errors = @poster.errors.messages
      render "edit"
    end
  end

  def add_point
    poster = Poster.find_by(id: params[:poster_id])
    poster.increment!(:points)
    @points = poster.points
    render json: @points, status: 200
  end

  private

  def poster_params
    params.require(:poster).permit(:title, :abstract, :filepath)
  end

end

