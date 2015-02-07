require 'rails_helper'

RSpec.describe FavoritesController, :type => :controller do
  # let!(:task1) { Task.create!(name: 'task1', complete: false) }
  # let!(:task2) { Task.create!(name: 'task2', complete: true) }

  describe 'GET index' do
    before(:each) { get :index }  
    
    it "successfully render index" do
      expect( response ).to be_success
    end

    it "renders the index view file" do
      expect( response ).to render_template(:index)
    end
  end
end