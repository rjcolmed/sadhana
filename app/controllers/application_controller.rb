class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_logged_in?, :is_teacher?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_logged_in?
    !!current_user
  end

  def is_teacher?
    current_user.type == 'Teacher'
  end
end
