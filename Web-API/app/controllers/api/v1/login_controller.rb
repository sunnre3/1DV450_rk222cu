class Api::V1::LoginController < Api::V1::ApiController
	include ActionView::Helpers::TextHelper

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
			@id = u.id
			@token = Base64.encode64(params[:email] + ':' + params[:password])[0..-2]

			session[:userid] = u.id
			render :template => 'api/v1/login/success'
		else
			render :status => 401, :template => 'api/v1/login/failure'
		end
	end
end
