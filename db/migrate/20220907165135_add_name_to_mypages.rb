class AddNameToMypages < ActiveRecord::Migration[7.0]
  def change
    add_column :mypages, :name, :string
  end
end
