class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id 
			redirect_to @user
		else
			@error = "Unsuccessful"
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

end
