class Truck < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites
  belongs_to :truck_account
  has_many :markers

  validates_presence_of :name
end
