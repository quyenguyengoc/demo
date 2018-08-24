class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :participants, default: 0
      t.integer :owner_id

      t.timestamps
    end
  end
end
