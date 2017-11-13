module LessonsHelper
  def is_enrolled?
    @lesson.students.include?(current_user)
  end
end