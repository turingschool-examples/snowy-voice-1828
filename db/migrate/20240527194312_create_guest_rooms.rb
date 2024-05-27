class CreateGuestRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :guest_rooms do |t|

      t.timestamps
    end
  end
end
