class SessionsController < ApplicationController

  def create

    @user = User.find_by(email: params[:email])

    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      @error = "That wasn't quite right"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

end
