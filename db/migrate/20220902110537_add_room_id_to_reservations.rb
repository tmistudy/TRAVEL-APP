class AddRoomIdToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :room_id, :integer
  end
end
