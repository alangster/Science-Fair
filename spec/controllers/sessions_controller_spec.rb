require 'rails_helper'

describe SessionsController do 

	before do 
		@user = User.create!(first_name: "alex", last_name: "alex", email: "alex@gmail.com", password: "password")
	end

	describe ".create" do 

		it "should set session[:user_id] equal to the id of the user who logged in, if the password is correct" do 
			# user = User.create!(first_name: "alex", last_name: "alex", email: "alex@alex.com", password: "password")
			post :create, { user: {email: @user.email, password: @user.password }}
			expect(assigns[:session[:user_id]]).to eq(@user.id) 
			# Why doesn't this test work?
		end

		it "should set an error instance variable when passed an invalid email/password" do 
			post :create, { user: {email: "email", password: @user.password }}
			expect(assigns[:error]).to eq("That wasn't quite right") 
		end

	end

end