class GuestRoomsController < ApplicationController
  def create
    # pry
    @guest = Guest.find(params[:id])
    @room = Room.find(params[:room])
    GuestRoom.create!(guest_id: @guest.id, room_id: @room.id)
    
    redirect_to "/guests/#{@guest.id}"
  end
end