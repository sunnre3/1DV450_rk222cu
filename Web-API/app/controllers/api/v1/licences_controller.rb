class Api::V1::LicencesController < Api::V1::ApiController
	# GET api/v1/licences.json
	# GET api/v1/licences.xml
	def index
		@licences = Licence.paginate(:page => params[:page])

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