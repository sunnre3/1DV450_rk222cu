class ControlPanelController < ApplicationController
	# Require the user to be logged in.
	before_action :require_authentication

	# Index is where the user can do whatever
	# his role is allowed to. Basic is changing
	# his own user credentials and requesting
	# API keys.
	def index
		# Define @user so we can use it in
		# the view.
		@user = current_user
	end
end
