class CreateRoomChats < ActiveRecord::Migration[5.0]
  def change
    create_table :room_chats do |t|
      t.integer :room_id
      t.integer :participant_id

      t.timestamps
    end
  end
end
