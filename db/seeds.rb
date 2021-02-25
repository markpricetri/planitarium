# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

Review.destroy_all
Booking.destroy_all
Show.destroy_all
User.destroy_all

puts "creating users"

matt = User.create!(email: "matt@planitarium.com", password: "mattsmith", first_name: "Matt", last_name: "Smith")
ben = User.create!(email: "ben@planitarium.com", password: "benskingsley", first_name: "Ben", last_name: "Skingsley")
marcel = User.create!(email: "marcel@planitarium.com", password: "marcelmeyer", first_name: "Marcel", last_name: "Meyer")
mark = User.create!(email: "mark@planitarium.com", password: "markprice", first_name: "Mark", last_name: "Price")

puts "created users"
puts "creating shows"

pink_floyd = Show.create!( name: "Dark side of the Moon", capacity: 40, start_time: 20, user: matt)
file = URI.open("https://source.unsplash.com/YFg5sDB3rZ4")
pink_floyd.photo.attach(io: file, filename: 'pink_floyd.jpg', content_type: 'image/jpg')

planets = Show.create!( name: "Planets", capacity: 30, start_time: 12, user: marcel)
file = URI.open("https://source.unsplash.com/RF4p4rTM-2s")
planets.photo.attach(io: file, filename: 'planets.jpg', content_type: 'image/jpg')

puts "created shows"
