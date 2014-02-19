class LoginController < ApplicationController
	# Index is the actual login page with
	# the login form etc.
	def index
	end

	# Login is where the login form
	# actually posts to.
	def login
		# Checks if there's a user associated
		# with the given email.
		u = User.find_by_email(params[:email])

		# If we find an email and the user
		# supplied the correct password we 
		# login the user by starting a session.
		# We also redirect the user to the
		# control panel.
		if u && u.authenticate(params[:password])
			session[:userid] = u.id
			redirect_to control_panel_path
		else
			redirect_to login_page_path
		end
	end
end
 