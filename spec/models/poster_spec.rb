require 'rails_helper'

RSpec.describe Poster, :type => :model do

  let(:alex) {User.create!(first_name: "Alex", last_name: "Drennen", email: "drennen42@gmail.com", password: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}
  let(:vince) {User.create!(first_name: "Vince", last_name: "Li", email: "vince@gmail.com", password: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}
  let(:user) {User.create!(first_name: "User", last_name: "Li", email: "user@gmail.com", password: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}
  let(:user_2) {User.create!(first_name: "User2", last_name: "Li", email: "user2@gmail.com", password: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}
  let(:user_3) {User.create!(first_name: "User3", last_name: "Li", email: "user3@gmail.com", password: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}
  let(:user_4) {User.create!(first_name: "User4", last_name: "Li", email: "user4@gmail.com", password: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}
  let(:poster) {Poster.create!(title: "The Disturbing Negative Effects On The Brain Of Development Bootcamps", abstract: "Deveopment bootcamps place a great amount strain on the brains of subjects.  Development bootcamp subjects are commonly referred to by the bootcamp instructiors as 'boots'.  We believe this nickname was created due to the demeanor in which the instructors treat the subjects.", filepath: "../uploads/images/poster.jpeg", creator: alex)}
  
  before do 
    UserPoster.create!(poster: poster, user: alex)
    UserPoster.create!(poster: poster, user: vince)
  end

  it "should have a title" do
    expect(poster.title).to_not be_nil
  end

  it "should have an abstract" do
    expect(poster.abstract).to_not be_nil
  end

  it "should have a filepath" do
    expect(poster.filepath).to_not be_nil
  end

  it "should have a creator." do
    expect(poster.creator).to_not be_nil
  end

  it "should default to 0 points" do
    expect(poster.points).to eq(0)
  end

  it "should reject posters that do not satisfy the validations" do 
    poster_1 = Poster.new(title: "The Disturbing Negative Effects On The Brain Of Development Bootcamps", abstract: "Deveopment bootcamps place a great amount strain on the brains of subjects.  Development bootcamp subjects are commonly referred to by the bootcamp instructiors as 'boots'.  We believe this nickname was created due to the demeanor in which the instructors treat the subjects.", filepath: "../uploads/images/poster.jpeg")
    poster_2 = Poster.new(abstract: "Deveopment bootcamps place a great amount strain on the brains of subjects.  Development bootcamp subjects are commonly referred to by the bootcamp instructiors as 'boots'.  We believe this nickname was created due to the demeanor in which the instructors treat t", filepath: "../uploads/images/poster.jpeg", creator: alex)
    poster_3 = Poster.new(title: "The Disturbing Negative Effects On The Brain Of Development Bootcamps", filepath: "../uploads/images/poster.jpeg", creator: alex)
    expect([poster_1, poster_2, poster_3].select {|poster| poster.valid?}.count).to eq(0)
  end

  describe ".author_emails" do 

    it 'should return an array of the emails of the users associated with the poster' do 
      expect(poster.author_emails).to eq(["drennen42@gmail.com", "vince@gmail.com"])
    end

  end

  describe ".credit_where_it_is_due" do 

    it "should add UserPoster records for authors" do 
      user 
      user_2
      expect do  
        poster.credit_where_it_is_due({"id" => 1, "email1" => "user2@gmail.com", "email2" => "user@gmail.com", "whatever" => "kajbg@srjng", "email3" => "", "email4" => "skajhn@kjs.com"})
      end.to change{UserPoster.count}.by(3)
      expect(UserPoster.last(3).map {|up| up.user_id}).to eq([user_2.id, user.id, alex.id])
    end

  end

  describe ".update_credit" do

    it "should add UserPoster records for new authors" do 
      user
      user_2
      user_3
      user_4
      poster.credit_where_it_is_due({"id" => 1, "email1" => "user2@gmail.com", "email2" => "user@gmail.com", "whatever" => "kajbg@srjng", "email3" => "", "email4" => "skajhn@kjs.com"})
      expect do 
        poster.update_credit({"id" => 1, "email1" => "user2@gmail.com", "email2" => "user@gmail.com", "whatever" => "kajbg@srjng", "email3" => "", "email4" => "skajhn@kjs.com", "email5" => "user3@gmail.com", "email6" => "user4@gmail.com"})
      end.to change{UserPoster.count}.by(2)
      expect(UserPoster.last(2).map {|up| up.user_id}).to eq([user_3.id, user_4.id])
    end

  end

end
