class RenameSpacetypesTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :space_types, :rooms
  end
end
