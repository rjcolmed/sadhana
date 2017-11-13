class EnrollmentController < ApplicationController
  def create
    if params[:lesson_id]
      lesson = Lesson.find_by(id: params[:lesson_id])
      lesson.students << current_user

      redirect_to lessons_path
    else
    end
  end
end