class Api::V1::ApiController < ApplicationController
	before_filter :check_api_key

	def default_url_options
		{ format: 'json', limit: 1 }
	end
	
	# Method for handling 404 errors in this
	# specific API version.
	def RNFResponse
		respond_to do |format|
			format.json { render :template => 'api/v1/errors/404', :status => :not_found }
			format.xml { render :template => 'api/v1/errors/404', :status => :not_found }
		end
	end

	# "Helper" method for verifying an API key with our API server.
	def check_api_key
		token = request.headers['Token']

		if token
			require 'net/http'
			url = URI.parse('http://127.0.0.1:3002/api_keys/' + request.headers['Token'])
			req = Net::HTTP::Get.new(url.path)
			res = Net::HTTP.start(url.host, url.port) {
				|http| http.request(req)
			}

			if res.code.to_i != 200
				render :template => 'api/v1/errors/401', :status => :unauthorized
			end

			# Since we have a render call in here we need to return
			# so that we second render doesn't get called.
			return
		end

		render :template => 'api/v1/errors/401', :status => :unauthorized
	end

	# Matches a HTTP Basic Authentication with our database.
	def check_user_credentials
		authenticate_or_request_with_http_basic do |email, password|
			if (controller_name == 'resources' && action_name == 'create')
				user = User.find_by(id: params[:resource][:user_id]) unless params[:resource] == nil

			elsif (controller_name == 'resources' && (action_name == 'update' || action_name == 'destroy'))
				resource = Resource.find_by(id: params[:id])
				user = User.find_by(id: resource.user_id) unless resource == nil

			elsif (controller_name == 'tags' && (action_name == 'create' || action_name == 'edit' || action_name == 'destroy'))
				resource = Resource.find_by(id: params[:resource_id])
				user = User.find_by(id: resource.user_id) unless resource == nil
			end

			# Return true/false if we find a user, the user's email
			# matches the one that was provided in the HTTP header
			# and if the password also matches the user.
			return user && user.email == email && user.authenticate(password)
		end
	end

	# Filter method for making sure the user is logged in and has a
	# valid API key provided aswell.
	def check_authentication
		# If the user credentials doesn't check out we render a 401.
		if !check_user_credentials
			render :template => 'api/v1/errors/401', :status => :unauthorized
		end
	end
end