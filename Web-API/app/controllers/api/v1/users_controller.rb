class ::Api::V1::UsersController < Api::V1::ApiController
	# GET /api/v1/users/{:user_id}.json
	# GET /api/v1/users/{:user_id}.xml
	def show
		# GET /api/v1/users/{:user_id}
		@user = User.find_by_id(params[:id])

		# If no user was found with the
		# given id we return a formatted error.
		if @user == nil
			self.RNFResponse
		end
	end
	
	# GET /api/v1/users.json
	# GET /api/v1/users.xml
	def index
		# Check for optional limit parameter.
		if params[:limit].nil?
			params[:limit] = params[:default][:limit]
		end

		# GET /api/v1/users
		@users = User.paginate(:page => params[:page], :per_page => params[:limit])
	end
end