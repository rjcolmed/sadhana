class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[show]
  
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

  private

  def set_teacher
    @teacher = Teacher.find_by(id: params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end