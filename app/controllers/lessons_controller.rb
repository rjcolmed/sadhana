class LessonsController < ApplicationController
  # before_action :set_teacher, only: %i[new create]

  def index
    if params[:user_id]
      #add code to retrieve teacher's lessons here
    else
      @lessons = Lesson.all
    end
  end

  def new
    @teacher = set_teacher
    @lesson = Lesson.new
  end

  def create
    lesson = Lesson.new(lesson_params)

    if lesson.save
      redirect_to teacher_lesson_path(lesson, lesson.teacher)
    else
      render :new
    end
  end

  def show
  end

  private

  def set_teacher
    @teacher = Teacher.find_by(id: params[:teacher_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :description, :location, :teacher_id)
  end
end