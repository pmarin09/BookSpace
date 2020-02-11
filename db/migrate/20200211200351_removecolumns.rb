class Removecolumns < ActiveRecord::Migration[6.0]
  def change
   remove_column :Rooms, :user_id
   remove_column :Rooms, :reservation_start
   remove_column :Rooms, :reservation_end
  end
end
