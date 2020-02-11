class Renametablerooms1 < ActiveRecord::Migration[6.0]
  def change
    rename_table :rooms1, :rooms
  end
end
