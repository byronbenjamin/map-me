json.array!(@future_trips) do |future_trip|
  json.extract! future_trip, :id
  json.url future_trip_url(future_trip, format: :json)
end
