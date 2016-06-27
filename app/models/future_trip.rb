class FutureTrip < ActiveRecord::Base

  belongs_to :user
  validates :name, presence: true

  def self.set_coordinates(future_trip)
    Geocoder.coordinates(future_trip.name)
    coordinates = Geocoder.coordinates(future_trip.name)
    future_trip.latitude = coordinates[0]
    future_trip.longitude = coordinates[1]
  end

end
