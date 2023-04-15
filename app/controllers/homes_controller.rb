class HomesController < ApplicationController
  def index
    redirect_to dashboards_path if current_user
  end
end
