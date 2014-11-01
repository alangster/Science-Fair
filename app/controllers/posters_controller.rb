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
        #render error
      end
  end

  def edit
    @poster = Poster.find(params[:id])
    @author_emails = @poster.author_emails
  end

  def update
    @poster = Poster.find(params[:id])
    @poster.update_attributes(poster_params)
    if @poster.save
      @poster.update_credit(params)
    else

    end
  end

  private

  def poster_params
    params.require(:poster).permit(:title, :abstract, :filepath)
  end

  # def credit_where_it_is_due(params)
  #   filter_emails(params).each do |key, value|
  #     if value != "" && user = User.find_by(email: value)
  #       UserPoster.create!(poster: @poster, user: user)
  #     end
  #   end
  # end

  # def update_credit(params)
    
  # end

  # def filter_emails(params)
  #   params.select do |key|
  #     /email\d/.match(key)
  #   end
  # end

end

