class GuestsController < ApplicationController
  def show
    @guest = Guest.find(params[:id])
  end

  def add_room
    @guest = Guest.find(params[:id])
    room = Room.find(params[:room_id])
    @guest.rooms << room
    # guest_id = params[:guest_id]
    # @guest_room = GuestRoom.create!(guest_id: guest_id, room_id: params[:room_id])
    redirect_to "/guests/#{guest_id}"
  end
end