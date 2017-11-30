module LessonsHelper
  def is_enrolled?
    @lesson.students.include?(current_user)
  end

  def is_lesson_owner?
    current_user == @lesson.teacher
  end
end