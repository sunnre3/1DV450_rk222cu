class ControlPanelController < ApplicationController
	# Require the user to be logged in.
	before_action :require_authentication

	# Index is where the user can do whatever
	# his role is allowed to. Basic is changing
	# his own user credentials and requesting
	# API keys.
	def index
		# Define @user so we can use
		# it in the view.
		@user = current_user

		# Get the correct API key.
		@key = ApiKey.find_by_user_id @user.id

		# If the user is an admin
		# we supply all users.
		if @user.isAdmin
			@users = User.all
		end
	end
end
