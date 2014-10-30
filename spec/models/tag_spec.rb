require 'rails_helper'

RSpec.describe Tag, :type => :model do

  let(:tag) {Tag.create!(discipline: "Biology")}

  it "should have a discipline" do
    expect(tag.discipline).to eq("Biology")
  end
end
