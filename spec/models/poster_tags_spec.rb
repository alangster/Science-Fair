require 'rails_helper'

RSpec.describe PosterTag, :type => :model do

  let(:alex) {User.create!(first_name: "Alex", last_name: "Drennen", email: "drennen42@gmail.com", password_hash: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}
  let(:poster) {Poster.new(title: "The Disturbing Negative Effects On The Brain Of Development Bootcamps", abstract: "Deveopment bootcamps place a great amount strain on the brains of subjects.  Development bootcamp subjects are commonly referred to by the bootcamp instructiors as 'boots'.  We believe this nickname was created due to the demeanor in which the instructors treat the subjects.", filepath: "../uploads/images/poster.jpeg", creator: alex)}
  let(:tag) {Tag.create!(discipline: "Biology")}
  let(:post_tag) {PosterTag.create!(poster: poster, tag: tag)}

  it "should belong to a poster." do
    expect(post_tag.poster).to eq(poster)
  end

  it "should belong to a tag." do
    expect(post_tag.tag).to eq(tag)

  end
end
