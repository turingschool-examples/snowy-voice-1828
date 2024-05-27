# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hotel1 = Hotel.create(name: "Expensive Hotel", location: "A Very Expensive Place")
hotel2 = Hotel.create(name: "Luxury Inn", location: "Luxury Street")

room1 = Room.create(rate: 250, suite: "Emperor", hotel: hotel1)
room2 = Room.create(rate: 125, suite: "Presidential", hotel: hotel1)
room3 = Room.create(rate: 300, suite: "Royal", hotel: hotel2)
room4 = Room.create(rate: 150, suite: "Deluxe", hotel: hotel2)

guest1 = Guest.create(name: "Joe the Man", nights: 3)

GuestRoom.create(guest: guest1, room: room1)
GuestRoom.create(guest: guest1, room: room2)
GuestRoom.create(guest: guest1, room: room3)

guest2 = Guest.create(name: "Jane the Woman", nights: 2)

GuestRoom.create(guest: guest2, room: room3)
GuestRoom.create(guest: guest2, room: room4)