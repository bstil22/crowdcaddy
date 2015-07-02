require 'spec_helper'

describe Course do 
  it "has a valid factory" do
    expect(FactoryGirl.create(:course)).to be_valid
  end
  it "is invalid without a number of holes" do
    expect(FactoryGirl.build(:course, number_holes: nil)).to be_invalid
  end
  it "is invalid without a number of holes" do
    expect(FactoryGirl.build(:course, number_holes: nil)).to be_invalid
  end
  it "is invalid without a name" do
    expect(FactoryGirl.build(:course, name: nil)).to be_invalid
  end
  it "is invalid without a city" do
    expect(FactoryGirl.build(:course, city: nil)).to be_invalid
  end
  it "is invalid without a style" do
    expect(FactoryGirl.build(:course, style: nil)).to be_invalid
  end
  it "is invalid without a state" do
    expect(FactoryGirl.build(:course, state: nil)).to be_invalid
  end
  it "is invalid when a slope contains a letter" do
    expect(FactoryGirl.build(:course, slope: 'ssdf24')).to be_invalid
  end
end