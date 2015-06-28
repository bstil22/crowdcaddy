require 'rails_helper'
require 'devise'

RSpec.describe CoursesController, :type => :controller do
  before :each do 
    user = FactoryGirl.create(:user)
    sign_in user
  end

  describe "GET index" do
    it "populates an array of courses" do 
      course = FactoryGirl.create(:course)
      get :index 
      pp course
      assigns(:courses).should eq([course])
    end    
    it "renders the :index view" do 
      get :index 
      expect(response).to render_template(:index)
    end 
  end
end