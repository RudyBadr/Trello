class UsersController < ApplicationController
  def register
  	@user = User.new
  end
  def show
  end
  def create
  	@user = User.new(params.require(:user).permit(:fullName,:username,:password_digest))
  	if @user.save
  		redirect_to dashboard_url
  	else
  		redirect_to welcome_url, error: @user.errors
  	end
  end
end
