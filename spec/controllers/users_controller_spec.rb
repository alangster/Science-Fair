require 'rails_helper'

describe UsersController do 

	let(:alex) {User.create!(first_name: "Alex", last_name: "Drennen", email: "drenn@gmail.com", password_hash: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}

	describe ".show" do 

		it "finds the appropriate user" do 
			get :show, {id: alex.id}
			expect(assigns[:user]).to eq(alex)
		end


	end

end