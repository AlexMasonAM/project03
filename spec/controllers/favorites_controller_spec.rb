require 'rails_helper'

RSpec.describe Api::FavoritesController, :type => :controller do
  # let!(:task1) { Task.create!(name: 'task1', complete: false) }
  # let!(:task2) { Task.create!(name: 'task2', complete: true) }

  describe 'GET index' do
    before(:each) { get :index }  
    
    it "successfully render index" do
      expect( response ).to be_success
    end

    it "renders the index view file" do
      fav = Favorite.create(truck_id: nil, user_id: nil)
      get :index, format: :json
      expect( response.body ).to eq([fav].to_json)
    end
  end
end