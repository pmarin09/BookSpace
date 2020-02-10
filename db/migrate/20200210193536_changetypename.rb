class Changetypename < ActiveRecord::Migration[6.0]
  def change

    rename_column :space_types, :type, :types_of_spaces

  end
end
