class TasksController < ApplicationController
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

	def create
		@story = current_user.projects.find(params[:project_id]).stories.find(params[:story_id])
		if @story
			@task = @story.tasks.new(tasks_params)
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
	def tasks_params
		params.require(:task).permit(:name,:description)
	end
end
