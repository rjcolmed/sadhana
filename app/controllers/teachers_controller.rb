class TeachersController < ApplicationController
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

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end