class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  @assigned_user = false
 # rescue_from ActiveRecord::RecordNotFound do
  #  redirect_to projects_url
  #end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :avatar, :password, :password_confirmation, :email) }
  end
	def after_sign_up_path_for(resource)
		welcome_test_path
	end
	def after_sign_in_path_for(resource_or_scope)
		dashboard_url
	end
  def set_project!
    begin
       @project = current_user.projects.find(params[:project_id])
   rescue
      @project = Project.find(params[:project_id])
      @assigned_user = true
   end
    #if current_user.projects.find(params[:project_id]).nil?
      
      
  end
  def verify_user_assinged_to_story_or_is_project_creator!
    project = current_user.projects.where("id = ?",params[:project_id])
    if project.count == 0
      project = Project.find(params[:project_id])
      if project
          story = project.stories.find(params[:story_id])
          project_member = project.project_members.find_by(:user_id => current_user)
          if story.member_stories.find_by(:project_member_id => project_member.id) == nil
            redirect_to projects_url
          else
            @assigned_user = true
          end
      end
    end
  end
end
