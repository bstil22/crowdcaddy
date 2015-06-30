require 'rails_helper'
require 'devise'

RSpec.describe TipsController, :type => :controller do
  before :each do 
    user = FactoryGirl.create(:user)
    sign_in user
    @course = FactoryGirl.create(:course)
    @hole = Hole.create!(yardage: 233, par: 3, hole_number: 4, course_id: @course.id)
    @attrs = FactoryGirl.attributes_for(:tip, :hole_id => @hole)
    @invalid = FactoryGirl.attributes_for(:invalid_tip, :hole_id => @hole)

  end

  describe "GET index" do
    it "populates an array of tips" do 
      tip = FactoryGirl.create(:tip)
      get :index 
      expect(assigns(:tips)).to eq([tip])
    end    
    it "renders the :index view" do 
      get :index 
      expect(response).to render_template(:index)
    end 
  end

  describe "POST create" do
  context "with valid attributes" do
    it "creates a new tip" do
      expect{
        post :create, :hole_id => @hole, :tip => @attrs
      }.to change(Tip,:count).by(1)
    end

    it "redirects upon saving" do
      post :create, :hole_id => @hole, :tip => @attrs
      expect(response).to have_http_status(302)
    end
  end

  context "with invalid attributes" do
    it "does not save the new tip" do
      expect{
        post :create, :hole_id => @hole, :tip => @invalid
      }.to_not change(Tip,:count)
    end

    it "re-renders the new method" do
      post :create, :hole_id => @hole, :tip => @invalid
      expect(response).to render_template :new
    end
  end 
end

  describe "GET #show" do
    it "assigns the requested tip to @tip" do 
      tip = FactoryGirl.create(:tip) 
      get :show, id: tip 
      expect(assigns(:tip)).to eq(tip)
    end 
    it "renders the #show view" do 
      get :show, id: FactoryGirl.create(:tip) 
      expect(response).to render_template(:show)
    end 
  end
end