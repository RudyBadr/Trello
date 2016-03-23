class TasksController < ApplicationController
	before_action :set_task, only: [:edit,:update]
	def index
		@story = current_user.projects.find(params[:project_id]).stories.find(params[:story_id])
		@tasks = @story.tasks.paginate(:page => params[:page], :per_page => 10)
	end
	def new
		@project = current_user.projects.find(params[:project_id])

		if @project
			@story = @project.stories.find(params[:story_id])
			if @story
				@task = @story.tasks.new
			end
		else
		end
	end
	def edit

	end
	def update
		respond_to do |format|
			if @task.update(task_params)
				format.html
				format.js
			else
				format.html
				format.js
			end
		end
	end
	def create
		@story = current_user.projects.find(params[:project_id]).stories.find(params[:story_id])
		if @story
			@task = @story.tasks.new(task_params)
			respond_to do |format|
				if @task.save
					format.html
					format.js
				else
					format.html
					format.js
				end
			end
		end
	end
	private

	def set_task
		@task = current_user.projects.find(params[:project_id]).stories.find(params[:story_id]).tasks.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:name,:description)
	end
end
