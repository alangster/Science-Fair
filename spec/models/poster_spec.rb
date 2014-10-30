require 'rails_helper'

RSpec.describe Poster, :type => :model do

  let(:alex) {User.create!(first_name: "Alex", last_name: "Drennen", email: "drennen42@gmail.com", password_hash: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}
  # poster = Poster.create!(title: "The Disturbing Negative Effects On The Brain Of Development Bootcamps", abstract: "Deveopment bootcamps place a great amount strain on the brains of subjects.  Development bootcamp subjects are commonly referred to by the bootcamp instructiors as 'boots'.  We believe this nickname was created due to the demeanor in which the instructors treat the subjects.", filepath: "../uploads/images/poster.jpeg", creator_id: 1)
  let(:poster) {Poster.new(title: "The Disturbing Negative Effects On The Brain Of Development Bootcamps", abstract: "Deveopment bootcamps place a great amount strain on the brains of subjects.  Development bootcamp subjects are commonly referred to by the bootcamp instructiors as 'boots'.  We believe this nickname was created due to the demeanor in which the instructors treat the subjects.", filepath: "../uploads/images/poster.jpeg", creator: alex)}

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
end
