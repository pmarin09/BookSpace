class CreateCoworkingSpace < ActiveRecord::Migration[6.0]
  def change
    rename_column :coworking_spaces, :user_id, :coworking_id
    create_table :coworking_spaces do |t|
        t.integer :user_id
        t.string :name
        t.text :address
        t.string :city
        t.integer :spaces_qty

        t.timestamps

    end
  end
end
