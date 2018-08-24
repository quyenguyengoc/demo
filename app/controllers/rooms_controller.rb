class RoomsController < ApplicationController
  before_action :authenticate_user
  include RoomsHelper

  def create
    room = Room.new room_params
    if room.valid?
      room.save
      room.broadcast_newroom
      redirect_to room
    end
  end

  def show
    @room = Room.find_by(id: params[:id])
    redirect_to root_path and return unless @room
    if new_member?(@room)
      roomchat = RoomChat.create(participant: current_user, room: @room)
      message = Message.create(content: "New member: #{current_user.fullname}", room: @room)
      message.broadcast_newmessage if message.valid?
      roomchat.broadcast_newmember if roomchat.valid?
    end
  end

  private
  def room_params
    params.require(:room).permit(:name).merge!(owner: current_user)
  end
end
