class SessionsController < ApplicationController
  def new
  end

  def create
    raise params.inspect
  end

  def destroy
  end

  private

  def sessions_params
    params.require(:user).permit(:username, :password)
  end
end