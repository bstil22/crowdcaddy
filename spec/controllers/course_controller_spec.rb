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
      expect(assigns(:courses)).to eq([course])
    end    
    it "renders the :index view" do 
      get :index 
      expect(response).to render_template(:index)
    end 
  end

  describe "GET #show" do
    it "assigns the requested course to @course" do 
      course = FactoryGirl.create(:course) 
      get :show, id: course 
      expect(assigns(:course)).to eq(course)
    end 
    it "renders the #show view" do 
      get :show, id: FactoryGirl.create(:course) 
      expect(response).to render_template(:show)
    end 
  end
end