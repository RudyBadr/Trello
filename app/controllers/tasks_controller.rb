class TasksController < ApplicationController
	before_action :set_task, only: [:edit,:update]
	#before_action :verify_user_assinged_to_story_or_is_project_creator!
	before_action :set_project!
	def index
		@story = @project.stories.find(params[:story_id])
		@tasks = @story.tasks.paginate(:page => params[:page], :per_page => 10)
	end
	def new
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
		@story = @project.stories.find(params[:story_id])
		if !params[:render_normal].nil?
			@render_default = false
		else
			@render_default = true
		end
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

	def state
		@story = @project.stories.find(params[:story_id])
		@task = @story.tasks.find(params[:task_id])
		@task.update(:state=>params[:state])
	end
	private

	def set_task
		@task = @project.stories.find(params[:story_id]).tasks.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:name,:description)
	end
	def verify_user_assinged_to_story_or_is_project_creator!
		project = current_user.projects.where("id = ?",params[:project_id])
		if project.count == 0
			project = Project.find(params[:project_id])
			if project
				story = project.stories.find(params[:story_id])
				project_member = project.project_members.find_by(:user_id => current_user)
				if story.member_stories.find_by(:project_member_id => project_member.id) == nil
					redirect_to project_stories_url(project)
				else
					@assigned_user = true
				end
			end
		end
	end
	
end
