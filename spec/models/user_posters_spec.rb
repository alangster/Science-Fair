require 'rails_helper'

RSpec.describe UserPoster, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:user_poster) {UserPoster.create!(user_id: 1, poster_id: 1)}

  it "should belong to a user." do
    expect(user_poster.user_id).to eq(1)
  end

  it "should belong to a poster." do
    expect(user_poster.poster_id).to eq(1)
  end
end
