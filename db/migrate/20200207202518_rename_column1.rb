class RenameColumn1 < ActiveRecord::Migration[6.0]
  def change
    rename_column :coworking_spaces, :user_id, :coworking_id
  end
end
