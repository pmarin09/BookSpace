class Removecolumns < ActiveRecord::Migration[6.0]
  def change
   remove_column :rooms, :user_id
   remove_column :rooms, :reservation_start
   remove_column :rooms, :reservation_end
  end
end
