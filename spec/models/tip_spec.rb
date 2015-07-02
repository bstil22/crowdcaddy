require 'spec_helper'

describe Tip do 
  it "has a valid factory" do
    expect(FactoryGirl.create(:tip)).to be_valid
  end
  it "is invalid without a yardage" do
    expect(FactoryGirl.build(:tip, yardage: nil)).to be_invalid
  end
  it "is invalid without a hole id" do
    expect(FactoryGirl.build(:tip, hole_id: nil)).to be_invalid
  end
  it "is invalid without a body" do
    expect(FactoryGirl.build(:tip, body: nil)).to be_invalid
  end
  it "capitalizes sentences in the body properly" do
    tip = FactoryGirl.build(:tip, body: "i am a really poor typist. i dont like to capitalize letters.")
    expect(tip.capitalize_attributes).to eq "I am a really poor typist. I dont like to capitalize letters."
  end
end