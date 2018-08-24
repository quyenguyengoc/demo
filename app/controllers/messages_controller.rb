class MessagesController < ApplicationController
  before_action :authenticate_user
  before_action :load_room

  def create
    message = Message.new message_params
    message.broadcast_newmessage if message.save
  end

  private

  def load_room
    @room = Room.find_by(id: params[:room_id])
    return unless @room
  end
  def message_params
    params.require(:message).permit(:content).merge!(sender: @current_user, room: @room)
  end
end
