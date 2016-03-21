class WelcomeController < ApplicationController
	before_action :authenticate_user!
	def index
		@user = User.new
	end
	def test
	end
    def resource_name
    	:user
  	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end
end
