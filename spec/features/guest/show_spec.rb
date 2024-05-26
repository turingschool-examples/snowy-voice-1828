require "rails_helper"

RSpec.describe Guest do
  it "shows the guest show page including guest name the rooms they stayed in including the room's suite, nightly rate and the name of the hotel" do
    @guest1 = Guest.create!(name: "George Russell", nights: 2 )
    @hotel1 = Hotel.create!(name: "Echo Mountain Inn", location: 'Echo Mountain')
    @room1 = Room.create!(rate: 100, suite: 'Standard', hotel_id: "#{@hotel1.id}")
    GuestRoom.create!(guest: @guest1, room: @room1)
    
    visit "/guests/1"


  end
end