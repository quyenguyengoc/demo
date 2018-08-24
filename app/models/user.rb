class User < ApplicationRecord

  before_create :set_avatar

  has_secure_password
  has_many :owner_rooms, class_name: 'Room', foreign_key: :owner_id
  has_many :room_chats, foreign_key: :participant_id
  has_many :joined_rooms, through: :room_chats, source: :room
  has_many :messages, foreign_key: :sender_id

  enum status: [:online, :in_game]

  AVATARS = ['bear.png', 'octopus.png', 'fox.png', 'koala.png', 'wolf.png']

  def set_avatar
    self.avatar = AVATARS.sample
  end
end
