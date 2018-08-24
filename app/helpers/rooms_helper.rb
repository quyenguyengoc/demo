module RoomsHelper

  def is_owner?(room)
    room.owner == @current_user
  end

  def new_member?(room)
    room.participants.exclude?(current_user) && !is_owner?(room)
  end
end
