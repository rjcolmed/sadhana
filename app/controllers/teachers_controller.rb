class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[show edit update]
  before_action :check_if_logged_in, only: %i[create edit update]

  def index
    @teachers = Teacher.alphabetize
  end
  
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      session[:user_id] = @teacher.id

      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @teacher.update(teacher_params)

    if @teacher.valid?
      redirect_to teacher_path(@teacher)
    else
      render :edit
    end
  end

  private

  def set_teacher
    @teacher = Teacher.find_by(id: params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end