class TruckAccount < ActiveRecord::Base
  include ActiveModel::SecurePassword
  
  has_many :trucks

  validates_presence_of :first_name, :last_name, :company, :email
  validates_uniqueness_of :email

  has_secure_password
end
