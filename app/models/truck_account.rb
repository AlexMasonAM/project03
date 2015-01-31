class TruckAccount < ActiveRecord::Base
  has_many :trucks

  validates_presence_of :first_name, :last_name, :company, :email, :password, :password_confirmation
  validates_uniqueness_of :email
end
