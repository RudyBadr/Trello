class MembersController < ApplicationController
	def index
		@project = current_user.projects.find(params[:project_id])
		if @project.project_members.count > 0
			@users = User.where("id not in (?) and id != ?",@project.project_members.map(&:user_id), current_user.id)
		else
			@users = User.where("id != ?",current_user.id)
		end
		respond_to do |format|
			format.html
			format.js 
		end
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
	def destroy
		@project = current_user.projects.find(params[:project_id])
		@member = @project.project_members.find(params[:id])
		@user = @member.user;
		respond_to do |format|
			if @member.destroy
				format.html
				format.js
			else
				format.html
				format.js
			end
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
