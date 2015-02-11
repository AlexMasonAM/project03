require 'rails_helper'

RSpec.describe Api::UsersController, :type => :controller do


  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end


  describe "GET index" do
    it "is successful" do
      get :index
      expect(response).to have_http_status 200
    end
    it "returns a list of users as json" do
      user = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user, email: 'test@test.com')
      get :index
      expect(User.count).to eq 2
      expect(response.body).to be_a String

      parsed = JSON.parse(response.body)
      expect(parsed[0]['id']).to eq user.id
      expect(parsed[1]['id']).to eq user2.id
    end
  end


  describe 'GET show' do
    it "is successful" do
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      expect(response).to have_http_status 200
    end
    it "returns correct truck account as json" do
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      expect(JSON.parse(response.body)['id']).to eq(user.id)
    end
  end


  describe 'POST create' do
    context "valid attributes" do
      let(:valid_attrs) { FactoryGirl.attributes_for(:user) }
      
      it "adds a user record" do
        expect{ post :create, user: valid_attrs }.to change(User, :count).by(1)
      end
      it "returns new truck account as json" do
        post :create, user: valid_attrs
        user = User.last
        expect(JSON.parse(response.body)['id']).to eq user.id
      end
    end
    context "invalid attributes" do
      let(:invalid_attrs) { FactoryGirl.attributes_for(:user, email: nil)}
      it "does not add record" do
        expect{ post :create, user: invalid_attrs }.to change(User, :count).by(0)
      end
      it "returns errors as json" do
        post :create, user: invalid_attrs
        expect(JSON.parse(response.body)).to include 'errors'
      end
      it "has 422 status" do
        post :create, user: invalid_attrs
        expect(response).to have_http_status 422
      end
    end
  end


  describe 'PUT update' do
    let(:user) { FactoryGirl.create(:user) }

    context "valid attributes" do
      let(:valid_attrs) do
        {email: 'test@test.com'}
      end

      it "updates existing user account" do
        put :update, id: user.id, user: valid_attrs
        expect(user.reload.email).to eq(valid_attrs[:email])
      end
      it "returns updated user as json" do
        put :update, id: user.id, user: valid_attrs
        expect(JSON.parse(response.body)['id']).to eq user.id
        expect(JSON.parse(response.body)['email']).to eq 'test@test.com'
      end
    end
    context "invalid attributes" do
      let(:invalid_attrs) do
        { email: nil }
      end
      it "doesn't update existing user account" do
        original_email = user.email
        put :update, id: user.id, user: invalid_attrs
        expect(user.reload.email).to eq(original_email)
      end
      it "returns errors as json" do
        put :update, id: user.id, user: invalid_attrs
        expect(JSON.parse(response.body)).to include 'errors'
      end
      it "has 422 status" do
        put :update, id: user.id, user: invalid_attrs
        expect(response).to have_http_status 422
      end
    end
  end


  describe 'DELETE destroy' do
    let!(:user) { FactoryGirl.create(:user) }

    it "destroys user record" do
      expect{ delete :destroy, id: user.id }.to change(User, :count).by(-1)
    end
    it "returns destroyed user as json" do
      delete :destroy, id: user.id
      expect(JSON.parse(response.body)['id']).to eq user.id
    end
  end

end

