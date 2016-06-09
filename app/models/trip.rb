class Trip < ActiveRecord::Base

  belongs_to :user

  geocoded_by :name

  def findCoordinates(location)
    Geocoder.coordinates(location)
  end

end
