class Modifycolumn < ActiveRecord::Migration[6.0]
  def change
    change_column :space_types, :available, :boolean, :default => true

  end
end
