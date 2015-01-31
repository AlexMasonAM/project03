class Truck < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :truck_account

  validates_presence_of :name
end
