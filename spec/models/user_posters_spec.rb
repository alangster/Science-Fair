require 'rails_helper'

RSpec.describe UserPosters, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:user_poster) {User_Poster.create!(user_id: User.first.id, poster_id: Poster.first.id)}

  it "should belong to a user." do
    expect(user_poster.user_id).to eq(User.first.id)
  end

  it "should belong to a poster." do
    expect(user_poster.poster_id).to eq(Poster.first.id)
  end
end
