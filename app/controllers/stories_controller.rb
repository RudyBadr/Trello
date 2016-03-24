class StoriesController < ApplicationController
	before_action :set_project!
	before_action :set_story, only: [:edit,:update]
	

	def index
		@stories = @project.stories.paginate(:page => params[:page], :per_page => 10)
	end
	def new
		@project = current_user.projects.find(params[:project_id])
		if @project
			@story = @project.stories.new
		else
		end
	end
	def assigned_members
		@story = current_user.projects.find(params[:project_id]).stories.find(params[:story_id])
		@members = current_user.projects.find(params[:project_id]).project_members.paginate(:page => params[:page], :per_page => 10)
	end
	def assign_member
		@member = current_user.projects.find(params[:project_id]).stories.find(params[:story_id]).member_stories.new
		@member.project_member_id = params[:user_id]
		if @member.save
			redirect_to project_story_assigned_members_url(params[:project_id],params[:story_id])
		else
			redirect_to project_story_assigned_members_url(params[:project_id],params[:story_id], notice: 'Failed to assing user')
		end
	end
	def unassign_member
		@member = current_user.projects.find(params[:project_id]).stories.find(params[:story_id]).member_stories.find_by(:project_member_id => params[:user_id])
		if @member.destroy
			redirect_to project_story_assigned_members_url(params[:project_id],params[:story_id])
		else
			redirect_to project_story_unassigned_members_url(params[:project_id],params[:story_id], notice: 'Failed to unassing user')
		end
	end
	def show
		@story = @project.stories.find(params[:id])
		respond_to do |format|
			format.html
			format.js
		end
	end
	def edit
	end
	def create
		@project = current_user.projects.find(params[:project_id])
		if @project
			@story = @project.stories.new(story_params)
			respond_to do |format|
				if @story.save
					if params[:files]
						params[:files].each do |file|
							@story.story_files.create(file: file)
						end
					end
					format.html
					format.js
				else
					format.html
					format.js
				end
			end
		end
	end
	def update
		respond_to do |format|
			if @story.update(story_params)
				if params[:files]
					params[:files].each do |file|
						@story.story_files.create(file: file)
					end
				end
				format.html
				format.js
			else
				format.html
				format.js
			end
		end
	end
	def state
		@story = @project.stories.find(params[:story_id])
		@story.update(:state=>params[:state])
	end
	private
	def set_story
		@project = current_user.projects.find(params[:project_id])
		@story = @project.stories.find(params[:id])
	end
	def story_params
		params.require(:story).permit(:name,:description)
	end
end