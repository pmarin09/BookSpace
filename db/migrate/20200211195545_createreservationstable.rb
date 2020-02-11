class Createreservationstable < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id, foreign_key: true
      t.datetime :reservation_start
      t.datetime :reservation_end
      t.timestamps
    end
  end
end
