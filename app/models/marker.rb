class Marker < ActiveRecord::Base
  belongs_to :truck

  validates_presence_of :latitude, :longitude, :end_time

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
end
