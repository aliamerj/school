# home page affter log in
class DashboardsController < ApplicationController
  def index
    @user = current_user
    redirect_to new_login_path unless current_user
  end
end
