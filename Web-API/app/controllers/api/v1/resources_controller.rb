class Api::V1::ResourcesController < Api::V1::ApiController
	# On Create, Update and Delete make sure the user is logged in
	# and that a proper API key is provided.
	before_filter :check_authentication, :only => [ :create, :update, :destroy ]

	# GET /api/v1/resources/new.json
	# GET /api/v1/resources/new.xml
	def new
		@resource = Resource.new
	end

	# POST /api/v1/resources
	def create
		# Create a new Resource object from inbound arguments.
		@resource = Resource.new(resource_params)

		if @resource.save
			render :template => 'api/v1/resources/show', :status => :created
		else
			render :template => 'api/v1/errors/resource', :status => :bad_request
		end
	end

	# GET /api/v1/resources
	# GET /api/v1/users/{:user_id}/resources
	# GET /api/v1/tags/{:tag_id}/resources
	# GET /api/v1/resource_type/{:resource_type_id}/resources
	# GET /api/v1/licences/{:licence_id}/resources
	# FORMATS: .json, .xml
	def index
		# Check for optional limit parameter.
		if params[:limit].nil?
			params[:limit] = params[:default][:limit]
		end

		# GET /api/v1/resources
		@resources = Resource.search(params[:search]).order('id DESC').paginate(:page => params[:page], :per_page => params[:limit])

		# GET /api/v1/users/{:user_id}/resources
		if params[:user_id]
			@resources = Resource.search(params[:search]).where(user_id: params[:user_id]).order('id DESC').paginate(:page => params[:page], :per_page => params[:limit])
		end

		# GET /api/v1/tags/{:tag_id}/resources
		if params[:tag_id]
			@resources = Tag.find_by(id: params[:tag_id]).resources.order('id DESC').paginate(:page => params[:page], :per_page => params[:limit])
		end

		# GET /api/v1/resource_type/{:resource_type_id}/resources
		if params[:resource_type_id]
			@resources = Resource.where(resource_type_id: params[:resource_type_id]).order('id DESC').paginate(:page => params[:page], :per_page => params[:limit])
		end

		# GET /api/v1/licences/{:licence_id}/resources
		if params[:licence_id]
			@resources = Resource.where(licence_id: params[:licence_id]).order('id DESC').paginate(:page => params[:page], :per_page => params[:limit])
		end

		# If no resource was found with the
		# given id we return a formatted error.
		if @resources.count == 0
			self.RNFResponse
		end
	end

	# GET /api/v1/resources/{:resource_id}.json
	# GET /api/v1/resources/{:resource_id}.xml
	def show
		@resource = Resource.find_by(id: params[:id])

		# If no resource was found with the
		# given id we return a formatted error.
		if @resource == nil
			self.RNFResponse
		end
	end

	# PUT /api/v1/resources/{:resource_id}
	# PATCH /api/v1/resources/{:resource_id}
	def update
		@resource = Resource.find_by(id: params[:id])

		if @resource == nil
			self.RNFResponse
		elsif @resource.update_attributes(resource_params)
			render :template => 'api/v1/resources/show', :status => :ok
		else
			render :template => 'api/v1/errors/resource', :status => :bad_request
		end
	end

	# DELETE /api/v1/resources/{:resource_id}
	def destroy
		@resource = Resource.find_by(id: params[:id])

		# If no resource was found with the
		# given id we return a formatted error.
		if @resource == nil
			self.RNFResponse
		else
			# Destroy the resource.
			@resource.destroy

			# Render a template.
			render :template => 'api/v1/resources/destroy', :status => :ok
		end
	end

	private
	def resource_params
		params.require(:resource).permit(:resource_type_id, :user_id, :licence_id, :name, :description, :url)
	end
end