class EnrollmentController < ApplicationController
  def create
    if params[:lesson_id]
      lesson = Lesson.find_by(id: params[:lesson_id])
      student = current_user
      lesson.students << student

      redirect_to student_lessons_path(student)
    else
      redirect_to student_path(current_user)
    end
  end
end