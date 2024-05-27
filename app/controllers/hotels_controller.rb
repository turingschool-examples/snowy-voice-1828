class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    # binding.pry
  end
end