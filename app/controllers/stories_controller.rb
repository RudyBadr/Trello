class StoriesController < ApplicationController
	def new
		@project = current_user.projects.find(params[:project_id])
		if @project
			@story = @project.stories.new
		else
		end
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

	def story_params
		params.require(:story).permit(:name,:description)
	end
end