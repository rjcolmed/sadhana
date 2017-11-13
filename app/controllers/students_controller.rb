class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update]

  def new
    @student = Student.new
  end

  def create
  end

  def show
  end

  private

  def set_student
    @student = Student.find_by(id: params[:id])
  end
end