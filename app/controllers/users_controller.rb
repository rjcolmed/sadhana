class UsersController < ApplicationController
  def new
    @user = User.new

    #if i find a user who matches the email fb returns in auth
    # hash, skip the part below and go straight to user's show page

    if auth_hash = request.env['omniauth.auth']
      if @user = User.find_by_omniauth(auth_hash)
        session[:user_id] = @user.id
        
        is_teacher? ? (redirect_to teacher_path(@user)) : (redirect_to student_path(@user))
      else
        @user = User.create_by_omniauth(auth_hash)
       
      end
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      
      is_teacher? ? (redirect_to teacher_path(@user)) : (redirect_to student_path(@user))
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name, 
      :email, 
      :type, 
      :password, 
      :password_confirmation,
      :image,
      :uid
    )
  end
end