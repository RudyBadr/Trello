class DashboardController < ApplicationController
  def index
  	logger.debug current_user.projects_joined.inspect
  end
  def profile
  end
end
