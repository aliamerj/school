class LoginsController < ApplicationController

  def new
    redirect_to dashboards_path if current_user
    @user = User.new
  end

  def create
  @user = User.find_by(user_params)
  if @user
    log_in(@user)
    redirect_to dashboards_path

  else
    flash[:alert] = 'Email or password is wrong !'
    render :new, status: :unprocessable_entity
  end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
