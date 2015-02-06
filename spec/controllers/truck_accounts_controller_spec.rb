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
    context "valid attributes" do
      let(:valid_attrs) { FactoryGirl.attributes_for(:truck_account) }
      
      it "adds a truck_account record" do
        expect{ post :create, truck_account: valid_attrs }.to change(TruckAccount, :count).by(1)
      end
      it "redirects to truck_accounts_trucks page" do
        post :create, truck_account: valid_attrs
        id = TruckAccount.last.id
        expect(response).to redirect_to truck_account_trucks_path(id)
      end
    end
    context "invalid attributes" do
      let(:invalid_attrs) { FactoryGirl.attributes_for(:truck_account, email: nil)}
      it "does not add record" do
        expect{ post :create, truck_account: invalid_attrs }.to change(TruckAccount, :count).by(0)
      end
      it "renders the new truck account template" do
        post :create, truck_account: invalid_attrs
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET edit' do
    let(:truck_account) { FactoryGirl.create(:truck_account) }
    before(:each) {
      get :edit, id: truck_account.id
    }

    it "is successful" do
      expect(response).to have_http_status 200
    end
    it "renders edit template" do
      expect(response).to render_template :edit  
    end
    it "assigns truck_account to @truck_account variable" do
      expect( assigns(:truck_account) ).to eq truck_account
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
      it "redirects to truck_account_trucks_path" do
        put :update, id: truck_account.id, truck_account: valid_attrs
        expect(response).to redirect_to truck_account_trucks_path(truck_account)
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
      it "renders the edit template" do
        put :update, id: truck_account.id, truck_account: invalid_attrs
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:truck_account) { FactoryGirl.create(:truck_account) }

    it "assigns truck_account to @truck_account" do
      delete :destroy, id: truck_account.id
      expect( assigns(:truck_account) ).to eq truck_account
    end
    it "destroys truck_account record" do
      expect{ delete :destroy, id: truck_account.id }.to change(TruckAccount, :count).by(-1)
    end
  end

end