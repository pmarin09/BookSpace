class Deletetable < ActiveRecord::Migration[6.0]
  def change
    drop_table :coworking_users
  end
end
