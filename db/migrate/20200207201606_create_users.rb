class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :coworking_users do |t|
      t.integer :user_id
      t.string :username
      t.text :email

      t.timestamps
    end
  end
end
