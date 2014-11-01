require 'rails_helper'

RSpec.describe Comment, :type => :model do


  let(:alex) {User.create!(first_name: "Alex", last_name: "Drennen", email: "drennen42@gmail.com", password_hash: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}
  let(:vince) {User.create!(first_name: "Vince", last_name: "Li", email: "vince@gmail.com", password_hash: "ad", institution: "DevBootcamp", linkedin_url: "http://www.linkedin.com/drennen42", profile_pic: "../uploads/adrennen.jpg", degree: "Double Masters")}
  let(:poster) {Poster.create!(title: "The Disturbing Negative Effects On The Brain Of Development Bootcamps", abstract: "Deveopment bootcamps place a great amount strain on the brains of subjects.  Development bootcamp subjects are commonly referred to by the bootcamp instructiors as 'boots'.  We believe this nickname was created due to the demeanor in which the instructors treat the subjects.", creator: alex)}
  let(:comment) {Comment.create!(text: "I really like your poster!  It is an extremely accurrate portrayal of the terrible, horrible effects that bootcamps have on people's brains.  I myself took a develmeptal cmapboot and now I have bursts of paralysing pain in my fingertips when I type.  Many times for those bursts I completely spell wdrods grwon nda notd vene ntioce.  Shit.", user: alex, commentable: poster)}


  it "should have text." do
    expect(comment.text).to_not be_nil
  end

  it "should belong to a user." do
    expect(comment.user_id).to_not be_nil
  end

  it "should know what it is a comment on (what it's commentable_type is)." do
    expect(comment.commentable_type).to eq("Poster")
  end

  it 'should know all its sub-comments' do
    commentA = Comment.create(text: "A")
    comment1 = commentA.comments.create(text: "1")
    comment2 = commentA.comments.create(text: "2")
    comment2a = comment2.comments.create(text: "2a")
    comment1a = comment1.comments.create(text: "1a")
    comment1b = comment1.comments.create(text: "1b")

    expect(commentA.get_all_subcomments).to eq([comment1, comment1a, comment1b, comment2, comment2a])
  end

  describe 'get_user_responded_to' do

    it 'should return the name of the user to whom its commentable comment belongs' do
      sub_comment = Comment.create!(text: "What it do?", commentable: comment, user: vince)
      expect(sub_comment.get_user_responded_to).to eq("Alex Drennen")
    end

  end

end
