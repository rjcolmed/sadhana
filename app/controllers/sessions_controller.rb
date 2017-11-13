class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: sessions_params[:username])

    if @user && @user.authenticate(sessions_params[:password])
      session[:user_id] = @user.id

      redirect_to teacher_path(@user) if @user.type == 'Teacher'
      redirect_to student_path(@user) if @user.type == 'Student'
    else
    end
  end

  def destroy
  end

  private

  def sessions_params
    params.permit(:username, :password)
  end
end