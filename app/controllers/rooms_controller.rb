class RoomsController < ApplicationController
  def index
    # pry
    @rooms = Room.all
  end
end