class ProjectsController < ApplicationController
	def index
	end
	#before_action :authenticate_user!
	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.user_id = current_user.id
		respond_to do |format|
			if @project.save
				format.html{ redirect_to welcome_index}
				format.js
			else
				format.html{render new_project_path}
				format.js
			end
		end
	end

	private

	def project_params
		params.require(:project).permit(:title,:description)
	end
end
