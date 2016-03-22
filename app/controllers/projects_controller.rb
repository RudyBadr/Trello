class ProjectsController < ApplicationController
	def index
	end
	
	def new
		@project = current_user.projects.new
	end

	def create
		@project = current_user.projects.new(project_params)
		@users = User.where("id != ? " ,current_user.id)
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

	def join
		
	end


	private

	def project_params
		params.require(:project).permit(:title,:description)
	end
end
