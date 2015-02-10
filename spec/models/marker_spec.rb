require 'rails_helper'

RSpec.describe Marker, :type => :model do

  # let(:marker){FactoryGirl.build(:marker)}

  # it "should respond to latitude" do
  #   expect(marker).to respond_to("latitude")
  # end

  # it "should validate presence of latitude" do
  #   marker.latitude = nil
  #   expect(marker).to be_invalid
  # end

  # it "should respond to longitude" do
  #   expect(marker).to respond_to("longitude")
  # end

  # it "should validate presence of longitude" do
  #   marker.longitude = nil
  #   expect(marker).to be_invalid
  # end

  # it "should respond to address" do
  #   expect(marker).to respond_to("address")
  # end

  # it "should validate presence of address" do
  #   marker.address = nil
  #   expect(marker).to be_invalid
  # end

  # it "should respond to end_time" do
  #   expect(marker).to respond_to("end_time")
  # end

  # it "should validate presence of end_time" do
  #   marker.end_time = nil
  #   expect(marker).to be_invalid
  # end

  let(:marker){FactoryGirl.build(:marker)}

  it "has a latitude" do
    expect(marker).to respond_to(:latitude)
  end
  it "has a longitude" do
    expect(marker).to respond_to(:longitude)
  end

  it "has an address" do
    expect(marker).to respond_to(:address)
  end

  it "has an end_time" do
    expect(marker).to respond_to(:end_time)
  end

end
