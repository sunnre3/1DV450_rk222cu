class ::Api::V1::UsersController < Api::V1::ApiController
	def show
		@user = User.find_by_id(params[:id])

		# If no user was found with the
		# given id we return a formatted error.
		if @user == nil
			self.RNFResponse
		end
	end
	
	def index
		@users = User.paginate(:page => params[:page])
	end
end