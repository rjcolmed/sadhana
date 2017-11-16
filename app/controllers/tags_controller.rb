class TagsController < ApplicationController
  def index
    @tag = Tag.most_popular
  end

  def show
    @tag = Tag.find_by(id: params[:id])
  end
end