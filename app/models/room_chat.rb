class RoomChat < ApplicationRecord

  belongs_to :participant, class_name: 'User'
  belongs_to :room

  def broadcast_newmember
    RoomChannel.broadcast_to(self.room, { html: render_member, event: :new_member })
  end

  private
  def render_member
    ApplicationController.render(
      partial: 'shared/rooms/member',
      locals: { member: self.participant }
    )
  end
end
