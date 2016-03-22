class MembersController < ApplicationController
	def index
	end
	def create
		project = current_user.projects.find(params[:project_id])
		@user = User.find(params[:user_id])
		if project and @user and current_user != @user
			@project_member = project.project_members.new
			@project_member.user_id = params[:user_id]
			if @project_member.save
				handle_response
			else
				handle_response
			end
		else
			handle_response "Invalid Operation"
		end
	end

	private

	def handle_response msg=""
		respond_to do |format|
			format.html{ msg }
			format.js { msg }
		end
	end
end
