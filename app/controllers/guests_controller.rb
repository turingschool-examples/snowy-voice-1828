class GuestsController < ApplicationController
  def show
    @guest = Application.find(params[:id])
  end
