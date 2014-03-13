class Api::V1::ResourceTypesController < Api::V1::ApiController
	# GET api/v1/resource_types.json
	# GET api/v1/resource_types.xml
	def index
		@resource_types = ResourceType.all

		# If no resource types was found with the
		# given id we return a formatted error.
		if @resource_types == nil
			self.RNFResponse
		end
	end

	# GET api/v1/resource_types/{:resource_type_id}.json
	# GET api/v1/resource_types/{:resource_type_id}.xml
	def show
		@resource_type = ResourceType.find_by_id(params[:id])

		# If no resource type was found with the
		# given id we return a formatted error.
		if @resource_type == nil
			self.RNFResponse
		end
	end
end
