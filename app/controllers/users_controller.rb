class UsersController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to root_path
    else
      flash[:alert] = "Unable to update profile"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      flash[:success] = 'User was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to root_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :current_password)
  end

  def require_login
    redirect_to new_login_path unless current_user
  end
end
