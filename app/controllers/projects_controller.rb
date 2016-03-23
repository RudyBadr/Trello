class ProjectsController < ApplicationController
	before_action :set_project, only: [:edit, :update]
	def index
		@projects = current_user.projects.paginate(:page => params[:page], :per_page => 10)
	end

	def show

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
	def edit
		
	end
	def update
		respond_to do |format|
			if @project.update(project_params)
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
	def set_project
		@project = current_user.projects.find(params[:id])
	end
	def project_params
		params.require(:project).permit(:title,:description)
	end
end
