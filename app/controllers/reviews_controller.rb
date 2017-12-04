class ReviewsController < ApplicationController
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
end