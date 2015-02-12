require 'rails_helper'

RSpec.describe Api::FavoritesController, :type => :controller do

  it "has a valid factory" do
    expect(FactoryGirl.build(:favorite)).to be_valid
  end

  describe 'GET index' do
    before(:each) { get :index }  
    
    it "is successful" do
      expect(response).to have_http_status 200
    end

    it "returns a list of favorites as json" do
      user = FactoryGirl.create(:user)
      truck = FactoryGirl.create(:truck)
      fav = FactoryGirl.create(:favorite, user_id: user.id, truck_id: truck.id)
      get :index
      expect(response.body).to eq [fav].to_json
    end
  end
end