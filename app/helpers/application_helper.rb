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

  def is_lesson_owner?
    current_user == @lesson.teacher
  end

  def owns_show_page?
    current_user == @teacher
  end
end
