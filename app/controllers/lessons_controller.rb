class LessonsController < ApplicationController
  before_action :set_teacher, only: %i[new edit] 
  before_action :set_lesson, only: %i[show edit update]


  def index
    if params[:teacher_id]
      @lessons = set_teacher.lessons
    else
      @lessons = Lesson.all
    end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    lesson = Lesson.new(lesson_params)

    if lesson.save
      redirect_to teacher_lesson_path(lesson.teacher, lesson)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @lesson.update(lesson_params)

    if @lesson.valid?
      redirect_to teacher_lesson_path(@lesson.teacher, @lesson)
    else
      render :edit
    end
  end

  private

  def set_teacher
    @teacher = Teacher.find_by(id: params[:teacher_id])
  end

  def set_lesson
    @lesson = Lesson.find_by(id: params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :description, :location, :teacher_id)
  end
end