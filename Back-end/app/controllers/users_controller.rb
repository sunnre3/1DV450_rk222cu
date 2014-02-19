class UsersController < ApplicationController
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

		if @user.save
			session[:userid] = @user.id
			redirect_to root
		else
			render :action => 'new'
		end
	end

	# Edit shows a form for editing
	# a user.
	def edit
	end

	# All methods below are
  	# considered private.
 	private

	def user_params
		params.require(:user).permit(:firstname, :surname, :email, :password, :password_confirmation)
	end
end
