class LogoutsController < ApplicationController
  def index
    log_out if current_user
    redirect_to new_login_path
  end
end
