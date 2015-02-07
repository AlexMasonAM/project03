require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let!(:user) {FactoryGirl.build(:user)}

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST create" do
    let(:user1) {FactoryGirl.attributes_for(:user)}
    it "returns http success" do
      post :create, user: user1
      expect(response.status).to eq(302)
    end
  end

  describe "GET edit" do

    let!(:user) {FactoryGirl.create(:user)}

    it "returns http success" do
      get :edit, id: user.id
      expect(response).to render_template :edit
    end
  end

  describe "PATCH update" do
    let!(:user) {FactoryGirl.create(:user)}
    it "Update will redirect to " do
      patch :update, id: user.id, user: {first_name: 'a'}
      expect(response).to redirect_to users_path
    end
  end

  describe "GET show" do
    let!(:user) {FactoryGirl.create(:user)}
    it "returns http success" do
      get :show, id: user.id
      expect(response).to render_template :show
    end
  end

  describe "GET index" do
    let!(:user) {FactoryGirl.create(:user)}
    it "returns http success" do
      get :index, id: user.id
      expect(response).to render_template :index
    end
  end

  describe "GET destroy" do
    let!(:user) {FactoryGirl.create(:user)}
    it "returns http success" do
      delete :destroy, id: user.id
      expect(response).to redirect_to users_path

    end
  end

end
