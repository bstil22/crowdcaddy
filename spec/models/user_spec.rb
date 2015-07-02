require 'spec_helper'

describe User do 
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).to be_invalid
  end
  it "is invalid without a password" do
    expect(FactoryGirl.build(:user, password: nil)).to be_invalid
  end
  it "is invalid when the first name contains non letter characters" do
    expect(FactoryGirl.build(:user, first_name: 'hank343$$$')).to be_invalid
  end
  it "capitalizes sentences in the body properly" do
    expect(FactoryGirl.build(:user, last_name: ',,,..342ha$$$')).to be_invalid
  end
end