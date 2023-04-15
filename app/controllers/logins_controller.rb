class LoginsController < ApplicationController

  def new
    redirect_to dashboards_path if current_user
    @user = User.new
  end

  def create
  @user = User.authenticate(user_params[:email], user_params[:password])
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
