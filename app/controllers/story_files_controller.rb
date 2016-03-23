class StoryFilesController < ApplicationController
	before_action :set_project!
	def index
		@story = @project.stories.find(params[:story_id])
		@files = @story.story_files.paginate(:page => params[:page], :per_page => 10)
	end
end
