class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :introduction
      t.integer :price
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end
