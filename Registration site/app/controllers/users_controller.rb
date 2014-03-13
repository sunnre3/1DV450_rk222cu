class UsersController < ApplicationController
	# Require the user to be logged in.
	before_action :require_authentication, :only => :destroy

	# New shows the HTML form for
	# registrating as a developer.
	def new
		@user = User.new
	end

	# Create is where the registration
	# form posts to.
	def create
		# Calls the private method user_params.
		@user = User.new(user_params)

		# Set role id.
		@user.role = Role.find_by(role: 'Normal')

		if @user.save
			# Create an API key.
			@api = ApiKey.new

			# Set user_id
			@api.user_id = @user.id

			# Save API key.
			@api.save

			# Start a session to log in.
			session[:userid] = @user.id

			# Redirect to controlpanel.
			redirect_to control_panel_path
		else
			# If the save fails we render
			# the form page again with errors.
			render :action => 'new'
		end
	end

	# Destroys an User.
	def destroy
		@user = User.find_by(id: params[:id])

		if @user
			@user.destroy
			redirect_to control_panel_path
		end
	end

	# All methods below are
  	# considered private.
 	private

 	# Mass assignment made more secure.
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
