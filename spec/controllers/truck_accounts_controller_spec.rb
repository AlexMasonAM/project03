require 'rails_helper'

RSpec.describe Api::TruckAccountsController, type: :controller do


  it "has a valid factory" do
    expect(FactoryGirl.build(:truck_account)).to be_valid
  end


  describe 'GET index' do
    it "is successful" do
      get :index
      expect(response).to have_http_status 200
    end
    it "returns list of truck_accounts as json" do
      acct1 = FactoryGirl.create(:truck_account)
      acct2 = FactoryGirl.create(:truck_account, email: 'test@test.com')
      get :index
      expect(TruckAccount.count).to eq 2
      expect(response.body).to be_a String
      expect(response.body).to eq([acct1, acct2].to_json)
    end
  end


  describe 'GET show' do
    it "is successful" do
      acct = FactoryGirl.create(:truck_account)
      get :show, id: acct.id
      expect(response).to have_http_status 200
    end
    it "returns correct truck account as json" do
      acct = FactoryGirl.create(:truck_account)
      get :show, id: acct.id
      expect(response.body).to eq(acct.to_json)
    end
  end


  describe 'POST create' do
    context "valid attributes" do
      let(:valid_attrs) { FactoryGirl.attributes_for(:truck_account) }
      
      it "adds a truck_account record" do
        expect{ post :create, truck_account: valid_attrs }.to change(TruckAccount, :count).by(1)
      end
      it "returns new truck account as json" do
        post :create, truck_account: valid_attrs
        acct = TruckAccount.last
        expect(response.body).to eq(acct.to_json)
      end
    end
    context "invalid attributes" do
      let(:invalid_attrs) { FactoryGirl.attributes_for(:truck_account, email: nil)}
      it "does not add record" do
        expect{ post :create, truck_account: invalid_attrs }.to change(TruckAccount, :count).by(0)
      end
      it "returns errors as json" do
        post :create, truck_account: invalid_attrs
        expect(JSON.parse(response.body)).to include 'errors'
      end
      it "has 422 status" do
        post :create, truck_account: invalid_attrs
        expect(response).to have_http_status 422
      end
    end
  end


  describe 'PUT update' do
    let(:truck_account) { FactoryGirl.create(:truck_account) }

    context "valid attributes" do
      let(:valid_attrs) do
        {email: 'test@test.com'}
      end

      it "updates existing truck account" do
        put :update, id: truck_account.id, truck_account: valid_attrs
        expect(truck_account.reload.email).to eq(valid_attrs[:email])
      end
      it "returns updated truck_account as json" do
        put :update, id: truck_account.id, truck_account: valid_attrs
        expect(response.body).to eq(truck_account.reload.to_json)
      end
    end
    context "invalid attributes" do
      let(:invalid_attrs) do
        { email: nil }
      end
      it "doesn't update existing truck account" do
        original_email = truck_account.email
        put :update, id: truck_account.id, truck_account: invalid_attrs
        expect(truck_account.reload.email).to eq(original_email)
      end
      it "returns errors as json" do
        put :update, id: truck_account.id, truck_account: invalid_attrs
        expect(JSON.parse(response.body)).to include 'errors'
      end
      it "has 422 status" do
        put :update, id: truck_account.id, truck_account: invalid_attrs
        expect(response).to have_http_status 422
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:truck_account) { FactoryGirl.create(:truck_account) }

    it "destroys truck_account record" do
      expect{ delete :destroy, id: truck_account.id }.to change(TruckAccount, :count).by(-1)
    end
    it "returns destroyed truck_account as json" do
      delete :destroy, id: truck_account.id
      expect(response.body).to eq(truck_account.to_json)
    end
  end

end