class CoworkingSpace < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :name
      t.text :address
      t.string :city
      t.integer :spaces_qty
      

      t.timestamps
  end
end
