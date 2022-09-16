class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.integer :people

      t.timestamps
    end
  end
end
