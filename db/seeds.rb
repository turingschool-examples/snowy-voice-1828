# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
        hotel = Hotel.create!(name: "Marriott", location: "Jakarta")
        
        room = hotel.rooms.create!(suite: "A1", rate: 100)
        room2 = hotel.rooms.create!(suite: "A2", rate: 150)

        guest = Guest.create!(name: "Garrett Bowman", nights: 3)
        guest2 = Guest.create!(name: "John Banks", nights: 2)
        guest3 = Guest.create!(name: "Will James", nights: 5)

        guest.add_room(room.id)

        guest2.add_room(room.id)

        guest3.add_room(room2.id)