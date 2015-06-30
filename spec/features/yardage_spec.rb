require "rails_helper"

RSpec.describe TipsController, :type => :controller do
  describe "POST #create" do
    it "responds successfully with an HTTP 230 status code" do
      a = FactoryGirl.create(:course)
      b = a.holes.create!
      user = FactoryGirl.create(:user)
      sign_in :user, user
      post :create, :tip => { :body => "test tip", :yardage => 230, :course_id => a.id, :hole_id => b.id }, :course_id => a.id, :hole_id => b.id
      tip = Tip.last
      expect(tip.yardage).to equal(230) 
      expect(tip.course.id).to equal(a.id)  
      expect(response).to have_http_status(302)
    end
  end
end