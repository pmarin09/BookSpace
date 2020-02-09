class CreateTable1 < ActiveRecord::Migration[6.0]
  def change
    create_table :coworkingspaces do |t|
          t.integer :coworking_id
          t.string :name
          t.text :address
          t.string :city
          t.integer :spaces_qty

          t.timestamps
    end
  end
end
