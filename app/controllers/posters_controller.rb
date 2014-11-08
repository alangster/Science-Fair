class PostersController < ApplicationController

  skip_before_action :require_login, only: [:index, :show, :filter_sort, :download]

  def index
    @posters = Poster.all
  end

  def show
    @comments = Rails.cache.fetch("poster-#{params[:id]}") { Poster.find(params[:id]).includes(:comments) }.comments
    @comment_at_poster = Comment.new(commentable: @poster)
    @comment_at_comment = Comment.new()
  end

  def new
    @tags = Tag.all
    @poster = Poster.new
    @user = User.new
  end

  def create
    @poster = Poster.new(poster_params.merge(creator:current_user))
    if @poster.save
      @poster.credit_where_it_is_due(params[:emails])
      params[:poster][:tag_ids].reject{|id| id==""}.each do |id|
        @poster.tags << Tag.find(id.to_i)
      end

      #alt?
      #@poster.tags = params[:poster][:tag_ids]
      #  .reject{|id| id==""}
      #  .map{|id| Tag.find(id.to_i)}

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

  def filter_sort
    filter_option = params[:filter]
    sort_option = params[:sort]
    @posters = Poster.filter_sort(filter_option, sort_option)
    return render partial: "poster", collection: @posters, layout: false
  end

  def download
    poster = Poster.find(params[:id])
    send_file(poster.filepath.path,
      disposition: 'attachment',
      url_based_filename: false)
  end

  def destroy
    poster = Poster.find(params[:id])
    poster.delete
    redirect_to current_user
  end

  private

  def poster_params
    params.require(:poster).permit(:title, :abstract, :filepath, :audio_path, :poster_tags)
  end

end

