require 'rails_helper'


RSpec.describe TrucksController, type: :controller do
  
  describe 'GET index' do
    it "should be successful" do
      get :index
      expect(response).to have_http_status 200
    end
    it "should render index template" do
      get :index
      expect(response).to render_template :index
    end 
    it "should assign all trucks to @trucks variable" do
      truck = FactoryGirl.create(:truck)
      truck2 = FactoryGirl.create(:truck)
      get :index
      expect( assigns(:trucks) ).to eq [truck, truck2]
      # expect( assigns(:trucks) ).to include truck, truck2
    end
  end

  describe 'GET show' do

    let(:truck) { FactoryGirl.create(:truck) }

    before(:each) do
      get :show, id: truck.id
    end

    it "should be successful" do
      expect(response).to have_http_status 200
    end
    it "should render show template" do
      expect(response).to render_template :show
    end
    it "should assign truck to @truck variable" do
      expect( assigns(:truck) ).to eq truck
    end
  end

  describe 'POST create' do
    context "when form is valid" do
      let(:valid_attrs) { FactoryGirl.attributes_for(:truck) }

      it "adds a truck record" do
        acct = FactoryGirl.create(:truck_account)
        expect{ post :create, truck_account_id: acct.id, truck: valid_attrs }.to change(Truck, :count).by 1
      end
    end
    context "when form is invalid" do
      let(:invalid_attrs) { FactoryGirl.attributes_for(:truck, name: nil)}

      it "does not add a truck record" do
        acct = FactoryGirl.create(:truck_account)
        expect{ post :create, truck_account_id: acct.id, truck: invalid_attrs }.to change(Truck, :count).by 0
      end
    end
  end

  describe 'PUT update' do
    let(:acct) { FactoryGirl.create(:truck_account)}
    let(:truck) { FactoryGirl.create(:truck, truck_account_id: acct.id) }

    context "with valid attributes" do
      it "updates existing truck record" do
        put :update, truck_account_id: acct.id, id: truck.id, truck: {name: 'marshmallow'}
        expect(truck.reload.name).to eq 'marshmallow'
      end
    end
    context "with invalid attributes" do
      it "does not update truck record" do
        put :update, truck_account_id: acct.id, id: truck.id, truck: {name: nil}
        expect(truck.reload.name).to eq truck.name
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:acct) { FactoryGirl.create(:truck_account)}
    let!(:truck) { FactoryGirl.create(:truck, truck_account_id: acct.id) }

    it "should assign truck to @truck variable" do
      delete :destroy, truck_account_id: acct.id, id: truck.id
      expect( assigns(:truck) ).to eq truck
    end
    it "should destroy truck record" do
      expect{ delete :destroy, truck_account_id: acct.id, id: truck.id }.to change(Truck, :count).by -1
    end

  end

end




























