class Room < ApplicationRecord

  belongs_to :owner, class_name: 'User'
  has_many :room_chats
  has_many :participants, through: :room_chats, source: :participant
  has_many :messages

  def broadcast_newroom
    ActionCable.server.broadcast(
      "rooms",
      room_id: id,
      html: render_room
    )
  end

  private

  def render_room
    ApplicationController.render(
      partial: 'rooms/room',
      locals: {room: self}
    )
  end

end
