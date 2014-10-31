require 'debugger'

class SessionsController < ApplicationController

  def create
    # debugger
    @user = User.find_by(email: params[:email])
    p @user
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      # render "/layouts/header", layout: false
      respond_to do |format|
        format.js
      end
    else
      @error = "That wasn't quite right"
    end
  end

  def destroy

  end

end
