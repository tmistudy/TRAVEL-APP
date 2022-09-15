class CreateMypages < ActiveRecord::Migration[7.0]
  def change
    create_table :mypages do |t|
      t.string :my_img
      t.text :self_introduction

      t.timestamps
    end
  end
end
