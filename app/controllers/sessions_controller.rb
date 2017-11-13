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
    session.delete :user_id if session[:user_id]
    redirect_to root_path
  end

  private

  def sessions_params
    params.permit(:username, :password)
  end
end