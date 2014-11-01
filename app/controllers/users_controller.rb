class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user
		else
			redirect_to :back
			# @error = "Unsuccessful"
			# render # "profile page" for unregistered user, show errors and allow to re-attempt sign-up
		end
	end

	def show
		@user = User.find(params[:id])
		@posters = @user.authored_posters
	end

	def edit
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])
		@user.assign_attributes(user_params)
		if @user.save
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	 def add_point
    user = User.find_by(id: params[:user_id])
    user.increment!(:points)
    @points = user.points
    render json: @points, status: 200
  end

	private

	def user_params
		params.require(:user).permit(:profile_pic, :first_name, :last_name, :email, :password, :institution)
	end
end
