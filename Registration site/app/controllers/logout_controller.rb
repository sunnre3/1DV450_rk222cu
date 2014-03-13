class LogoutController < ApplicationController
	# Index lets a user logout by
	# destroying the session.
	def index
		session[:userid] = nil
		redirect_to root_path
	end
end
