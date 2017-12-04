class ReviewsController < ApplicationController
  before_action :set_teacher, only: %i[index]

  def index
    if params[:teacher_id]
      @reviews = set_teacher.reviews
    else
      @reviews = Review.all
    end

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @reviews }
    end
  end

  def create
    @review = Review.create(review_params)
    render json: @review, status: 201
  end

  def show
    @review = Review.find_by(id: params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @review }
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :student_id, :teacher_id)
  end

  def set_teacher
    @teacher = Teacher.find_by(id: params[:teacher_id])
  end
end