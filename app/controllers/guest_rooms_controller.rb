class GuestRoomsController < ApplicationController
    def create
        @guest = Guest.find(params[:id])
        @room = Room.find(params[:room_id])
        GuestRoom.create(guest_id: @guest.id, room_id: @room.id)

        redirect_to "/guests/#{params[:id]}"
    end
end