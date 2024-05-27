# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create some hotels
hotel1 = Hotel.create(name: "Grand Hotel", location: "New York")
hotel2 = Hotel.create(name: "Sea View Resort", location: "Miami")
hotel3 = Hotel.create(name: "Mountain Inn", location: "Denver")

# Create some rooms for each hotel
Room.create(rate: 200, suite: "Single", hotel: hotel1)
Room.create(rate: 300, suite: "Double", hotel: hotel1)
Room.create(rate: 400, suite: "Suite", hotel: hotel1)
Room.create(rate: 150, suite: "Single", hotel: hotel2)
Room.create(rate: 250, suite: "Double", hotel: hotel2)
Room.create(rate: 350, suite: "Suite", hotel: hotel2)
Room.create(rate: 100, suite: "Single", hotel: hotel3)
Room.create(rate: 200, suite: "Double", hotel: hotel3)
Room.create(rate: 300, suite: "Suite", hotel: hotel3)

# Create some guests
Guest.create(name: "Alice Johnson", nights: 3)
Guest.create(name: "Bob Smith", nights: 2)
Guest.create(name: "Charlie Brown", nights: 5)
Guest.create(name: "Diana Ross", nights: 1)
Guest.create(name: "Ethan Hunt", nights: 4)

puts "Seed data created successfully!"
