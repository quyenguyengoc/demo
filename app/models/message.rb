class Message < ApplicationRecord

  belongs_to :sender, class_name: 'User', optional: true
  belongs_to :room

  def broadcast_newmessage
    RoomChannel.broadcast_to(self.room, { html: render_message, sender_id: sender_id, event: :new_message })
  end

  private
  def render_message
    ApplicationController.render(
      partial: 'messages/message',
      locals: { message: self }
    )
  end
end
