class PostersController < ApplicationController

  def index
    @posters = Poster.all
  end


end
