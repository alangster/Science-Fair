require 'rails_helper'

RSpec.describe User, :type => :model do

  let!(:alex) {User.create(first_name: "Alex", last_name: "Drennen", email: "drennen42@gmail.com", password: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}
  let!(:poster) {Poster.create!(title: "The Disturbing Negative Effects On The Brain Of Development Bootcamps", abstract: "Deveopment bootcamps place a great amount strain on the brains of subjects.  Development bootcamp subjects are commonly referred to by the bootcamp instructiors as 'boots'.  We believe this nickname was created due to the demeanor in which the instructors treat the subjects.", filepath: "../uploads/images/poster.jpeg", creator: alex)}
  let!(:poster_2) {Poster.create!(title: "Development Bootcamps", abstract: "Deveopment bootcamps place a great amount strain on the brains of subjects.  Development bootcamp subjects are commonly referred to by the bootcamp instructiors as 'boots'.  We believe this nickname was created due to the demeanor in which the instructors treat the subjects.", filepath: "../uploads/images/poster.jpeg", creator: alex)}
  let!(:poster_3) {Poster.create!(title: "DevBootcamp", abstract: "Deveopment bootcamps place a great amount strain on the brains of subjects.  Development bootcamp subjects are commonly referred to by the bootcamp instructiors as 'boots'.  We believe this nickname was created due to the demeanor in which the instructors treat the subjects.", filepath: "../uploads/images/poster.jpeg", creator_id: 50)}
  let!(:tag) {Tag.create!(discipline: "biology")}
  let!(:user_poster) {UserPoster.create!(user: alex, poster: poster)}
  let!(:user_poster_2) {UserPoster.create!(user: alex, poster: poster_2)}
  let!(:user_poster_3) {UserPoster.create!(user: alex, poster: poster_3)}
  let!(:poster_tag) {PosterTag.create!(poster: poster, tag: tag)}

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

  describe "validations" do

    it "should not allow an account to be created without a password" do
      # alex
      expect(User.new(first_name: "Alex", last_name: "Drennen", email: "drennen42@gmail.com", password: "")).not_to be_valid
    end

    it "should not allow multiple accounts with the same email address" do
      # alex
      alex_2 = User.new(first_name: "Alex", last_name: "Drennen", email: "drennen42@gmail.com", password: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")
      expect(alex_2.valid?).to eq(false)
    end

    it "should not allow accounts to be created without an email address" do
     alex_2 = User.new(first_name: "Alex", last_name: "Drennen", password: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")
     expect(alex_2.valid?).to eq(false)
    end

    it "should not allow accounts to be created without a password" do
      alex_2 = User.new(first_name: "Alex", last_name: "Drennen", email: "Whatever@gmail.com", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")
      expect(alex_2.valid?).to eq(false)
    end

    it "should not allow accounts to be created without a first name" do
      alex_2 = User.new(last_name: "Drennen", email: "Whatever@gmail.com", password: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")
      expect(alex_2.valid?).to eq(false)
    end

    it "should not allow accounts to be created without a last name" do
      alex_2 = User.new(first_name: "Alex", email: "Whatever@gmail.com", password: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")
      expect(alex_2.valid?).to eq(false)
    end

  end

  describe "associations" do

    it "knows the posters it has created" do
      # alex
      expect(alex.created_posters).to eq([poster, poster_2])
    end

    it "knows its disciplines" do
      # poster_tag
      expect(alex.disciplines).to eq(["biology"])
    end
  end

end
