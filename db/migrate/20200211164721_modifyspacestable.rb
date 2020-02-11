class Modifyspacestable < ActiveRecord::Migration[6.0]
  def change
    add_column :space_types, :available, :boolean
    add_column :space_types, :user_id, :integer
    add_column :space_types, :reservation_start, :datetime
    add_column :space_types, :reservation_end, :datetime
  end
end
