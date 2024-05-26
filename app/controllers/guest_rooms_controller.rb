class GuestRoomsController < ApplicationController

  def add_room
    guest_id = params[:guest_id]
    room_id = params[:room_id]
    @guest_room = GuestRoom.create(guest_id: guest_id, room_id: room_id)
    redirect_to "/guests/#{guest_id}"
  end
end