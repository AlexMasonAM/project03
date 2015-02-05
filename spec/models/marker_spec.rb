require 'rails_helper'

RSpec.describe Marker, :type => :model do
    let(:marker){FactoryGirl.build(:marker)}

  # it "has a latitude" do
  #   expect(marker).to respond_to(:latitude)
  # end
  # it "has a longitude" do
  #   expect(marker).to respond_to(:longitude)
  # end

  it "has an address" do
    expect(marker).to respond_to(:address)
  end

  # it "has an end_time" do
  #   expect(marker).to respond_to(:end_time)
  # end




end
