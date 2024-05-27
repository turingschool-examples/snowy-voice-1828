class GuestRoom < ApplicationRecord
  belongs_to :rooms
  belongs_to :guests
end
