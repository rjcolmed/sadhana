class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      #add student's user_id to session hash here
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @student.update(student_params)

    if @student.valid?
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  private

  def set_student
    @student = Student.find_by(id: params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :password, :password_confirmation, :email, :username, :image)
  end
end