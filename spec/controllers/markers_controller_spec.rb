require 'rails_helper'

RSpec.describe Api::MarkersController, :type => :controller do

  it "has a valid factory" do
    expect(FactoryGirl.build(:marker)).to be_valid
  end


  describe "GET index" do
    it "is successful" do
      get :index
      expect(response).to have_http_status 200
    end
    it "returns a list of markers as json" do
      marker = FactoryGirl.build(:marker)
      marker.truck = FactoryGirl.create(:truck)
      marker.save
      marker2 = FactoryGirl.create(:marker)
      get :index
      expect(Marker.count).to eq 2
      expect(response.body).to be_a String

      parsed = JSON.parse(response.body)
      expect(parsed[0]['id']).to eq marker.id
      expect(parsed[0]['latitude'].round(2)).to eq marker.latitude.round(2)
      expect(parsed[0]['longitude'].round(2)).to eq marker.longitude.round(2)
      expect("\"#{parsed[0]['end_time']}\"").to eq marker.end_time.to_json
      expect("\"#{parsed[0]['created_at']}\"").to eq marker.created_at.to_json
      expect(parsed[0]['truck']).to be_a Hash
      expect(parsed[1]['id']).to eq marker2.id
    end
  end


  describe 'GET show' do
    it "is successful" do
      marker = FactoryGirl.create(:marker)
      get :show, id: marker.id
      expect(response).to have_http_status 200
    end
    it "returns correct truck account as json" do
      marker = FactoryGirl.create(:marker)
      get :show, id: marker.id
      expect(JSON.parse(response.body)['id']).to eq(marker.id)
    end
  end


  describe 'POST create' do
    context "valid attributes" do
      let(:valid_attrs) { FactoryGirl.attributes_for(:marker) }
      
      it "adds a marker record" do
        expect{ post :create, marker: valid_attrs }.to change(Marker, :count).by(1)
      end
      it "returns new truck account as json" do
        post :create, marker: valid_attrs
        marker = Marker.last
        expect(JSON.parse(response.body)['id']).to eq marker.id
      end
    end
    context "invalid attributes" do
      let(:invalid_attrs) { FactoryGirl.attributes_for(:marker, latitude: nil)}
      it "does not add record" do
        expect{ post :create, marker: invalid_attrs }.to change(Marker, :count).by(0)
      end
      it "returns errors as json" do
        post :create, marker: invalid_attrs
        expect(JSON.parse(response.body)).to include 'errors'
      end
      it "has 422 status" do
        post :create, marker: invalid_attrs
        expect(response).to have_http_status 422
      end
    end
  end


end
