class RoomsGuestsController < ApplicationController
  def create
    # binding.pry
    roomsguest = RoomsGuest.create(room_id: params[:room_id], guest_id: params[:id])
    # binding.pry
    redirect_to "/guests/#{params[:id]}"
  end
end