class HomeController < ApplicationController

  def index
    if @current_user
      @rooms = Room.all
    else
      @new_user = User.new
    end
  end
end
