require 'rails_helper'

RSpec.describe PosterTag, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
  let(:post_tag) {PosterTag.create!(poster_id: Poster.first.id, tag_id: Tag.first.id)}

  it "should belong to a poster." do
    expect(post_tag.poster_id).to eq(Poster.first.id)
  end

  it "should belong to a tag." do
    expect(post_tag.tag_id).to eq(Tag.first.id)
  end
end
