class DashboardController < ApplicationController
  def index
  	@projects = current_user.projects.paginate(:page => params[:page], :per_page => 10)
  end
  
  def profile
  end
end
