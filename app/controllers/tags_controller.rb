class TagsController < ApplicationController
  def index
    @tag = Tag.most_popular
  end

  def show
    @tag = Tag.find_by(id: params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @tag }
    end
  end
end