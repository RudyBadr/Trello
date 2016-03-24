class DashboardController < ApplicationController
  def index
  	@projects = current_user.projects.paginate(:page => params[:page], :per_page => 10)
  	@other_projects = current_user.project_members
  end
  
  def profile
  end
end
