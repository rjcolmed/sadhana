class EnrollmentController < ApplicationController
  before_action :set_lesson, only: %i[create destroy]
  before_action :set_student, only: %i[create destroy]

  def create
    if params[:lesson_id]
      enrollment = @lesson.enrollments.create(student: @student)
      comment = Comment.new(
        body: comment_params[:body], 
        student: enrollment.student, 
        enrollment: enrollment, 
        lesson: enrollment.lesson
      )
      comment.save
      redirect_to student_lessons_path(@student)
    else
      redirect_to student_path(@student)
    end
  end

  def destroy
    @lesson.students.delete(@student)

    redirect_to student_lessons_path(@student)
  end

  private

  def set_lesson
    @lesson = Lesson.find_by(id: params[:lesson_id])
  end

  def set_student
    @student = Student.find_by(id: current_user.id)
  end

  def comment_params
    params.require(:comment).permit(:body, :student_id)
  end
end