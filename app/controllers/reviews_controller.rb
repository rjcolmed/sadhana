class ReviewsController < ApplicationController
  def create
    @review = Review.create(review_params)
    render json: @review, status: 201
  end

  private

  def review_params
    params.require(:review).permit(:body, :student_id, :teacher_id)
  end
end