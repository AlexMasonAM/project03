class User < ActiveRecord::Base

  include ActiveModel::SecurePassword


  has_and_belongs_to_many :trucks
  has_one :preference_list

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  validates :password, confirmation: true

  has_secure_password
end
