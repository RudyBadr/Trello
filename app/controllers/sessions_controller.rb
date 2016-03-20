class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:username])
  	if user and user.authenticate params[:password]
  		session[:user_id] = user.id
  	else
  		redirect_to welcome_url, alert: "Invalid Username or Password."
  	end
  end

  def destroy
  end
end
