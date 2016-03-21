class ProjectsController < ApplicationController
	#before_action :authenticate_user!
	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.user_id = current_user.id
		if @project.save
			redirect_to 
		else
			render new_project_path
		end
	end

	private

	def project_params
		params.require(:project).permit(:title,:description)
	end
end
