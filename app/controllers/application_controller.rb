class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  include SessionsHelper

  private

  def is_show_match?
    params[:controller] == 'matches' && params[:action] == 'show'
  end

  def authenticate_user
    return if @current_user
    redirect_to root_path
  end
end
