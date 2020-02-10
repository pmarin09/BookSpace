class CreateSpaceTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :space_types do |t|
      t.integer :coworkingspace_id, foreign_key: true
      t.string :type

      t.timestamps

    end
  end
end
