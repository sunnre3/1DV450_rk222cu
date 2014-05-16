class Api::V1::LogoutController < Api::V1::ApiController
	# Index lets a user logout by
	# destroying the session.
	def index
		session[:userid] = nil
	end
end
