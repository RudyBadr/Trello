class StoryFilesController < ApplicationController
	def index
		@story = current_user.projects.find(params[:project_id]).stories.find(params[:story_id])
		@files = @story.story_files.paginate(:page => params[:page], :per_page => 10)
	end
end
