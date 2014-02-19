class AppsController < ApplicationController
	# Require the user to be logged in.
	before_action :require_authentication

	# New lets a logged in developer
	# retrieve a new API key to use with
	# an application.
	def new
		@app = Application.new
	end
end
