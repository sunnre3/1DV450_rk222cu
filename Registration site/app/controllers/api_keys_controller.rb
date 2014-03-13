class ApiKeysController < ApplicationController
	def show
		@api_key = ApiKey.find_by(auth_token: params[:auth_token])

		if @api_key
			head :ok
		else
			head :bad_request
		end
	end
end
