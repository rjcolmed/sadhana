class LessonsController < ApplicationController
  before_action :set_teacher, only: %i[new]

  def index
    if params[:user_id]
      #add code to retrieve teacher's lessons here
    else
      @lessons = Lesson.all
    end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    
  end

  def show
  end

  private

  def set_teacher
    @teacher = Teacher.find_by(id: params[:teacher_id])
  end

  def lessons_params
    params.require(:lesson).permit(:title, :description, :location, :teacher_id)
  end
end