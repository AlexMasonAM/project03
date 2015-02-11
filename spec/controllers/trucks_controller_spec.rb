require 'rails_helper'


RSpec.describe Api::TrucksController, type: :controller do
  
  it "has a valid factory" do
    expect(FactoryGirl.build(:truck)).to be_valid
  end


  describe 'GET index' do
    it "should be successful" do
      get :index
      expect(response).to have_http_status 200
    end
    it "should return list of trucks as json data" do
      truck = FactoryGirl.create(:truck)
      truck2 = FactoryGirl.create(:truck)
      get :index
      expect(Truck.count).to eq 2
      parsed = JSON.parse(response.body)
      expect(parsed[0]['id']).to eq truck.id
      expect(parsed[1]['id']).to eq truck2.id
    end
  end


  describe 'GET show' do

    it "should be successful" do
      truck = FactoryGirl.create(:truck)
      get :show, id: truck.id
      expect(response).to have_http_status 200
    end
    it "should return truck json data" do
      truck = FactoryGirl.create(:truck)
      get :show, id: truck.id
      expect(JSON.parse(response.body)['id']).to eq truck.id
    end
  end


  describe 'POST create' do
    context "valid attributes" do
      let(:valid_attrs) { FactoryGirl.attributes_for(:truck) }
      
      it "adds a truck record" do
        expect{ post :create, truck: valid_attrs }.to change(Truck, :count).by(1)
      end
      it "returns new truck account as json" do
        post :create, truck: valid_attrs
        truck = Truck.last
        expect(JSON.parse(response.body)['id']).to eq truck.id
      end
    end
    context "invalid attributes" do
      let(:invalid_attrs) { FactoryGirl.attributes_for(:truck, name: nil)}
      it "does not add record" do
        expect{ post :create, truck: invalid_attrs }.to change(Truck, :count).by(0)
      end
      it "returns errors as json" do
        post :create, truck: invalid_attrs
        expect(JSON.parse(response.body)).to include 'errors'
      end
      it "has 422 status" do
        post :create, truck: invalid_attrs
        expect(response).to have_http_status 422
      end
    end
  end


  describe 'PUT update' do
    let(:truck) { FactoryGirl.create(:truck) }

    context "valid attributes" do
      let(:valid_attrs) do
        {name: 'test@test.com'}
      end

      it "updates existing truck account" do
        put :update, id: truck.id, truck: valid_attrs
        expect(truck.reload.name).to eq(valid_attrs[:name])
      end
      it "returns updated truck as json" do
        put :update, id: truck.id, truck: valid_attrs
        expect(JSON.parse(response.body)['id']).to eq truck.id
        expect(JSON.parse(response.body)['name']).to eq 'test@test.com'
      end
    end
    context "invalid attributes" do
      let(:invalid_attrs) do
        { name: nil }
      end
      it "doesn't update existing truck account" do
        original_name = truck.name
        put :update, id: truck.id, truck: invalid_attrs
        expect(truck.reload.name).to eq(original_name)
      end
      it "returns errors as json" do
        put :update, id: truck.id, truck: invalid_attrs
        expect(JSON.parse(response.body)).to include 'errors'
      end
      it "has 422 status" do
        put :update, id: truck.id, truck: invalid_attrs
        expect(response).to have_http_status 422
      end
    end
  end



  describe 'DELETE destroy' do
    let!(:truck) { FactoryGirl.create(:truck) }

    it "destroys truck record" do
      expect{ delete :destroy, id: truck.id }.to change(Truck, :count).by(-1)
    end
    it "returns destroyed truck as json" do
      delete :destroy, id: truck.id
      expect(JSON.parse(response.body)['id']).to eq truck.id
    end
  end

end


