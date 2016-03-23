class StoriesController < ApplicationController
	before_action :set_story, only: [:edit,:update]
	def index
		@project = current_user.projects.find(params[:project_id])
		@stories = @project.stories.paginate(:page => params[:page], :per_page => 10)
	end
	def new
		@project = current_user.projects.find(params[:project_id])
		if @project
			@story = @project.stories.new
		else
		end
	end
	def show
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
	private
	def set_story
		@project = current_user.projects.find(params[:project_id])
		@story = @project.stories.find(params[:id])
	end
	def story_params
		params.require(:story).permit(:name,:description)
	end
end