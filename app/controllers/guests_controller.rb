class GuestsController < ApplicationController
    def show
        @guest = Guest.find(params[:id])
    end

    def update
        @guest = Guest.find(params[:id])
        @guest.add_room(params[:room_id])
        
        redirect_to "/guests/#{params[:id]}"
    end
end