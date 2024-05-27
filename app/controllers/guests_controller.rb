class GuestsController < ApplicationController
  def show
    @guest = Guest.find(params[:id])
    binding.pry
  end
end