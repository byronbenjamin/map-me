# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create!(username: "ashylarry", email: "needlotion@yahoo.com", password: "password")
user2 = User.create!(username: "ashyashley", email: "needalotlotion@yahoo.com", password: "password")

trip1 = Trip.create!(user_id: user1.id, name: "Miami, Florida", longitude: -80.13000, latitude: 25.78830)
trip2 = Trip.create!(user_id: user1.id, name: "Seoul, S. Korea", latitude: 37.566535, longitude: 126.97796919999996)
