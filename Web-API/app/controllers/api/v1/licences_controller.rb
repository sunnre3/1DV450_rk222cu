class Api::V1::LicencesController < Api::V1::ApiController
	# GET api/v1/licences.json
	# GET api/v1/licences.xml
	def index
		# Check for optional limit parameter.
		if params[:limit].nil?
			params[:limit] = params[:default][:limit]
		end

		# GET /api/v1/licences
		@licences = Licence.paginate(:page => params[:page], :limit => params[:limit])

		# If no licences was found with the
		# given id we return a formatted error.
		if @licences == nil
			self.RNFResponse
		end
	end

	# GET api/v1/licences/{:licence_id}.json
	# GET api/v1/licences/{:licence_id}.xml
	def show
		@licence = Licence.find_by(id: params[:id])

		# If no licence was found with the
		# given id we return a formatted error.
		if @licence == nil
			self.RNFResponse
		end
	end
end