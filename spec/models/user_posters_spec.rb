require 'rails_helper'

RSpec.describe UserPoster, :type => :model do

  let(:user_poster) {UserPoster.create!(user_id: User.first, poster_id: Poster.first)}

  it "should belong to a user." do
    expect(user_poster.user_id).to eq(User.first)
  end

  it "should belong to a poster." do
    expect(user_poster.poster_id).to eq(Poster.first)
  end
end
