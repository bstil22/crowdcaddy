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

  describe "POST create" do
  context "with valid attributes" do
    it "creates a new course" do
      expect{
        post :create, course: FactoryGirl.attributes_for(:course)
      }.to change(Course,:count).by(1)
    end

    it "redirects to the new course" do
      post :create, course: FactoryGirl.attributes_for(:course)
      expect(response).to redirect_to(Course.last)
    end
  end

  context "with invalid attributes" do
    it "does not save the new contact" do
      expect{
        post :create, course: FactoryGirl.attributes_for(:invalid_course)
      }.to_not change(Course,:count)
    end

    it "re-renders the new method" do
      post :create, course: FactoryGirl.attributes_for(:invalid_course)
      expect(response).to render_template :new
    end
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