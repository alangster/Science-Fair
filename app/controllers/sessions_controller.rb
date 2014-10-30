class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.password == params[:user][:password]
      session[:user_id] = @user.id
    else
      @error = "That wasn't quite right"
    end
  end

  def destroy

  end

end
