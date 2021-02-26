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
Showing.destroy_all
Show.destroy_all
User.destroy_all

puts "creating users"

matt = User.create!(email: "matt@planitarium.com", password: "mattsmith", first_name: "Matt", last_name: "Smith")
ben = User.create!(email: "ben@planitarium.com", password: "benskingsley", first_name: "Ben", last_name: "Skingsley")
marcel = User.create!(email: "marcel@planitarium.com", password: "marcelmeyer", first_name: "Marcel", last_name: "Meyer")
mark = User.create!(email: "mark@planitarium.com", password: "markprice", first_name: "Mark", last_name: "Price")

puts "created users"
puts "creating shows"

description_planets = "A planetarium show which explores our cosmic neighbours through the eyes of space probes."
description_pink_floyd = "A music show with amazing visual effects including laser projections."
description_milky_way = "There are 200 billion stars in home galaxy. One is our sun, but how much do we know about the remaining 199.999.999.999 stars of the milky way? Let's find out!"
description_rock_star = "Meet your favourite Bands under the stars including an incredible laser show. This events takes place every month on a diffenrent location. If you want to find out who is performing this time, just click on preview video."

pink_floyd = Show.create!( name: "Dark side of the Moon", address: "10 Downing Street, London", user: matt, description: description_pink_floyd)
file = URI.open("https://source.unsplash.com/YFg5sDB3rZ4")
pink_floyd.photo.attach(io: file, filename: 'pink_floyd.jpg', content_type: 'image/jpg')

planets = Show.create!( name: "Planets", address: "Buckingham Palace, London SW1A 1AA", user: marcel, description: description_planets)
file = URI.open("https://source.unsplash.com/RF4p4rTM-2s")
planets.photo.attach(io: file, filename: 'planets.jpg', content_type: 'image/jpg')

milky_way = Show.create!( name: "Milky Way", address: "Tower of London, London EC3N 4AB", user: ben, description: description_milky_way)
file = URI.open("https://source.unsplash.com/9wH624ALFQA")
milky_way.photo.attach(io: file, filename: 'milky_way.jpg', content_type: 'image/jpg')

rock_star = Show.create!( name: "Secret Rock Star", address: "Shoreditch Stables, North, 138 Kingsland Rd, London E2 8DY", user: marcel, description: description_rock_star)
file = URI.open("https://source.unsplash.com/YFg5sDB3rZ4")
pink_floyd.photo.attach(io: file, filename: 'pink_floyd.jpg', content_type: 'image/jpg')


puts "created shows"
puts "creating showings"

date1 = DateTime.new(2021, 3, 2, 19, 00)
date2 = DateTime.new(2021, 3, 3, 9, 00)
date3 = DateTime.new(2021, 3, 4, 12, 00)
date4 = DateTime.new(2021, 3, 5, 14, 00)
date5 = DateTime.new(2021, 3, 6, 16, 00)
date6 = DateTime.new(2021, 3, 7, 18, 00)
date7 = DateTime.new(2021, 3, 8, 20, 00)


showing1 = Showing.create!( start_time: date1, capacity: 40, show: pink_floyd)
showing2 = Showing.create!( start_time: date2, capacity: 40, show: pink_floyd)
showing3 = Showing.create!( start_time: date3, capacity: 40, show: planets)
showing4 = Showing.create!( start_time: date4, capacity: 40, show: milky_way)
showing5 = Showing.create!( start_time: date5, capacity: 40, show: milky_way)
showing6 = Showing.create!( start_time: date6, capacity: 40, show: milky_way)
showing7 = Showing.create!( start_time: date7, capacity: 28, show: rock_star)

puts "created showings"
puts "creating bookings"

booking1 = Booking.create!( no_of_people: 4, user: ben, showing: showing1)
booking2 = Booking.create!( no_of_people: 4, user: ben, showing: showing2)
booking3 = Booking.create!( no_of_people: 1, user: ben, showing: showing3)
booking4 = Booking.create!( no_of_people: 2, user: marcel, showing: showing4)
booking5 = Booking.create!( no_of_people: 4, user: mark, showing: showing5)
booking6 = Booking.create!( no_of_people: 3, user: matt, showing: showing6)

puts "created bookings"
puts "creating reviews"

review1 = Review.create!( show: pink_floyd, content: "Great show, loved it!", rating: 5)
review1 = Review.create!( show: planets, content: "Great show, loved it!", rating: 5)
review1 = Review.create!( show: milky_way, content: "Great show, loved it!", rating: 5)
review1 = Review.create!( show: pink_floyd, content: "Good show, enjoyed it!", rating: 4)
review1 = Review.create!( show: planets, content: "Good show, enjoyed it!", rating: 4)
review1 = Review.create!( show: milky_way, content: "Goof show, enjoyed it!", rating: 4)
review1 = Review.create!( show: pink_floyd, content: "Awful show, avoid!", rating: 2)
review1 = Review.create!( show: planets, content: "Waste of money!!", rating: 1)
review1 = Review.create!( show: rock_star, content: "Saw a making of on TV. If this show is only half as good as people say it is, I'll definitely try to get tickets!", rating: 5)

puts "reviews created"
