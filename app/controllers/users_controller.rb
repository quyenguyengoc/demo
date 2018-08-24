class UsersController < ApplicationController

  def create
    user = User.new user_params
    if user.save
      login(user)
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :fullname)
  end
end
