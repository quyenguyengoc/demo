class SessionsController < ApplicationController

  def create
    user = User.find_by(username: session_params[:username])
    if user && user.authenticate(session_params[:password])
      login(user)
      redirect_to root_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
