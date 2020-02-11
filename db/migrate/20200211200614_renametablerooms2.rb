class Renametablerooms2 < ActiveRecord::Migration[6.0]
  def change
    rename_table :Rooms, :rooms1
  end
end
