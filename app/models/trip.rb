class Trip < ActiveRecord::Base

  belongs_to :user
  validates :name, presence: true

  def self.set_coordinates(trip)
    Geocoder.coordinates(trip.name)
    coordinates = Geocoder.coordinates(trip.name)
    trip.latitude = coordinates[0]
    trip.longitude = coordinates[1]
  end

end
