require 'rails_helper'

RSpec.describe MarkersController, :type => :controller do
  describe 'GET new' do
    before(:each) {
      get :new   
    }

    it "is successful" do
      expect(response).to be_success #checks for 200 status code in ruby response object
    end

    it "renders the new view file" do
      expect(response).to render_template :new
    end
  end

    describe 'POST create' do
     
      context "when form is valid" do  
        let(:valid_attributes) do
          FactoryGirl.attributes_for(:marker)
        end
  
        before(:each) {
          post :create, marker: valid_attributes   
        }
  
        it "renders :new when marker post is successful" do
          expect(response).to render_template :new
        end
  
        it "added a marker" do
          expect{ post :create, marker: valid_attributes }.to change(Marker, :count).by(1)
        end
      end
    end

end
