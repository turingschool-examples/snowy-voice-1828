class Hotel < ApplicationRecord
  has_many :rooms
  has_many :guests, through: :rooms

  def distinct_names
    guests.distinct.pluck(:name)
  end
end