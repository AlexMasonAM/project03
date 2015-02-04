require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user){FactoryGirl.build(:user)}

  it "should respond to first_name" do
    expect(user).to respond_to("first_name")
  end
  
  it "should validate presence of first_name" do
    user.first_name = nil
    expect(user).to be_invalid
  end

  it "should respond to last_name" do
    expect(user).to respond_to("last_name")
  end

  it "should validate presence of last_name" do
    user.last_name = nil
    expect(user).to be_invalid
  end

  it "should respond to email" do
    expect(user).to respond_to("email")
  end 

  it "should validate presence of email" do
    user.email = nil
    expect(user).to be_invalid
  end

  it "validates uniqueness of email" do
    user.save
    user2 = FactoryGirl.build(:user, email: user.email)

    expect(user2).to be_invalid
  end

  it "validates presence of password and password_confirmation" do
    user.password = nil
    user.password_confirmation = nil
    
    expect(user).to be_invalid
  end

  it "validates that password and password confirmation match" do
    user.password_confirmation = "not password"

    expect(user).to be_invalid
  end

  it "should respond to yelp_id" do
    expect(user).to respond_to("yelp_id")
  end
end
