require "rails_helper"

# Story 1
# Guest Show
# As a visitor
# When I visit a guest's show page
# I see the guest's name
# And I see a list of all the rooms they've stayed in
# including the room's suite, nightly rate, and the name of the hotel that it belongs to.

RSpec.describe "the guests show page" do
  context "as a visitor" do 
    it "I see the guest's name" do 
      guest_1 = Guest.create!(name: "Jim James")
    
      visit "/guests/#{guest_1.id}"

      expect(page).to have_content(guest_1.name)
    end
  end
end