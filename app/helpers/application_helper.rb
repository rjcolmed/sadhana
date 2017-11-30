module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_logged_in?
    !!current_user
  end

  def is_teacher?
    current_user.type == 'Teacher' if current_user
  end

  def is_student?
    current_user.type == 'Student' if current_user
  end

  def owns_show_page?
    current_user == @teacher || current_user == @student
  end

  def check_if_logged_in
    (redirect_to login_path) unless is_logged_in?
  end

  def redirect_check
    is_teacher? ? (redirect_to teacher_path(@user)) : (redirect_to student_path(@user))
  end
end
