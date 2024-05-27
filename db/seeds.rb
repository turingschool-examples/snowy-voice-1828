# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
guest = Guest.create(name: "Frank Sinatra")
hotel = Hotel.create(name: "The St Laurent", location: "Asbury Park")
room = Room.create(rate: 1000, suite: "Presidential")