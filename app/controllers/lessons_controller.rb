class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[show edit update]

  def index
    if params[:teacher_id]
      @lessons = set_teacher.lessons
    elsif params[:student_id]
      @lessons = set_student.lessons
    else
      @lessons = Lesson.all
    end

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @lessons }
    end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to teacher_lesson_path(@lesson.teacher, @lesson)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @lesson.comments
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

  def set_student
    @student = Student.find_by(id: params[:student_id])
  end

  def set_lesson
    @lesson = Lesson.find_by(id: params[:id])
  end

  def set_teacher
    @teacher = Teacher.find_by(id: params[:teacher_id])
  end

  def lesson_params
    params.require(:lesson).permit(
                            :title, 
                            :description, 
                            :location, 
                            :teacher_id,
                            :date,
                            :time, 
                            tag_ids: [], 
                            tags_attributes: [:name]
                            )
  end
end