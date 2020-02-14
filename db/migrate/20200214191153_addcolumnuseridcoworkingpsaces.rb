class Addcolumnuseridcoworkingpsaces < ActiveRecord::Migration[6.0]
  def change
    add_column :coworkingspaces, :user_id, :integer
  end
end
