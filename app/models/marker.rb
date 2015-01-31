class Marker < ActiveRecord::Base
  belongs_to :truck

  validates_presence_of :latitude, :longitude, :address, :end_time
end
