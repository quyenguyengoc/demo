module SessionsHelper

  def login(user)
    cookies.signed[:user_id] = user.id
  end

  def logout
    cookies.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

end
