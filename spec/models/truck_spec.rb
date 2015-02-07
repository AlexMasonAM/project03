require 'rails_helper'

RSpec.describe Truck, :type => :model do
  let(:truck) { FactoryGirl.build(:truck) }

  it "should respond to name" do
    expect(truck).to respond_to :name
  end
  it "should validate presence of name" do
    truck.name = nil
    expect(truck).to be_invalid
  end
  it "should respond to genre" do
    expect(truck).to respond_to :genre
  end
  it "should respond to twitter_handle" do
    expect(truck).to respond_to :twitter_handle
  end
  it "should respond to yelp_id" do
    expect(truck).to respond_to :yelp_id
  end
  it "should respond to yelp_ratings" do
    expect(truck).to respond_to :yelp_ratings
  end
  it "should respond to tweet_most_recent" do
    expect(truck).to respond_to :tweet_most_recent
  end

end


