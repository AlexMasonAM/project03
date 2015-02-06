require 'rails_helper'

RSpec.describe TruckAccountsController, type: :controller do


  describe 'GET show' do
    let(:truck_account) { FactoryGirl.create(:truck_account) }

    before(:each) {
      get :show, id: truck_account.id
    }

    it "is successful" do
      expect(response).to have_http_status 200
    end
    it "renders show template" do
      expect(response).to render_template :show
    end
    it "assigns truck account to @truck_account variable" do
      expect( assigns(:truck_account) ).to eq truck_account
    end
  end

  describe 'GET new' do
    it "is successful" do
      get :new
      expect(response).to have_http_status 200
    end
    it "renders new template" do
      get :new
      expect(response).to render_template :new
    end
    it "assigns new truck account to @truck_account" do
      get :new
      expect( assigns(:truck_account) ).to be_a(TruckAccount)
    end
  end

  describe 'POST create' do
    context "valid form" do
    end
    context "invalid form" do
    end
  end

  describe 'GET edit' do
    it "is successful"
    it "renders edit template"
    it "assigns truck_account to @truck_account variable"
  end

  describe 'PUT update' do
    context "valid attributes" do
    end
    context "invalid attributes" do
    end
  end

  describe 'DELETE destroy' do
    it "assigns truck_account to @truck_account"
    it "destroys truck_account record"
  end

end