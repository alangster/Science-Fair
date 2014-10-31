class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id 
			redirect_to @user
		else
			# @error = "Unsuccessful"
			render # "profile page" for unregistered user, show errors and allow to re-attempt sign-up
		end
	end

	def show
		@user = User.find(params[:id])
		@posters = @user.authored_posters
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

end
