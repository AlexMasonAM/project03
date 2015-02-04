require 'rails_helper'

RSpec.describe TruckAccount, :type => :model do
  let(:truck_account){FactoryGirl.build(:truck_account)}

  it "should respond to first_name" do
    expect(truck_account).to respond_to("first_name")
  end

  it "should validate presence of first_name" do
    truck_account.first_name = nil
    expect(truck_account).to be_invalid
  end

  it "should respond to last_name" do
    expect(truck_account).to respond_to("last_name")
  end

  it "should validate presence of last_name" do
    truck_account.last_name = nil
    expect(truck_account).to be_invalid
  end

  it "should respond to company" do
    expect(truck_account).to respond_to("company")
  end

  it "should validate presence of company" do
    truck_account.company = nil
    expect(truck_account).to be_invalid
  end

  it "should respond to email" do
    expect(truck_account).to respond_to("email")
  end

  it "should validate presence of email" do
    truck_account.company = nil
    expect(truck_account).to be_invalid
  end

  it "validates uniqueness of email" do
    truck_account.save
    truck_account2 = FactoryGirl.build(:truck_account, email: truck_account.email)

    expect(truck_account2).to be_invalid
  end

  it "validates presence of password and password_confirmation" do
    truck_account.password = nil
    truck_account.password_confirmation = nil

    expect(truck_account).to be_invalid
  end

  it "validates that password and password confirmation match" do
    truck_account.password_confirmation = "not password"

    expect(truck_account).to be_invalid
  end
end
