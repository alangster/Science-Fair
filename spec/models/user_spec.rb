require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:alex) {User.create!(first_name: "Alex", last_name: "Drennen", email: "drennen42@gmail.com", password_hash: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}
  let(:alex2) {User.new(first_name: "Alex", last_name: "Drennen", email: "drennen42@gmail.com", password_hash: "ad")}

  it "should not allow multiple accounts with a single email address" do
    # alex2 = User.new(first_name: "Alex", last_name: "Drennen", email: "drennen42@gmail.com", password_hash: "ad")
    expect(alex2.valid?).to eq(false)
  end

  describe "alex" do
    it "should have a first name." do
      expect(alex.first_name).to_not be_nil
    end

    it "should have a last name." do
      expect(alex.last_name).to_not be_nil
    end

    it "should have an email address" do
      expect(alex.email).to_not be_nil
    end

    it "should have the first name 'Alex'." do
      expect(alex.first_name).to eq("Alex")
    end

    it "should have the last name 'Drennen'." do
      expect(alex.last_name).to eq("Drennen")
    end

    it "should have the email address 'drennen42@gmail.com'." do
      expect(alex.email).to eq("drennen42@gmail.com")
    end

    it "should return its full name when #name is called" do
      expect(alex.name).to eq("Alex Drennen")
    end

  end
end
