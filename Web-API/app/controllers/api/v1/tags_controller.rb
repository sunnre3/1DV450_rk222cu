class Api::V1::TagsController < Api::V1::ApiController
	# On Create, Update and Delete make sure the user is logged in
	# and that a proper API key is provided.
	before_filter :check_authentication, :only => [ :create, :update, :destroy ]

	# POST /api/v1/resource/{:resource_id}/tags
	def create
		@resource = Resource.find_by(id: params[:resource_id])

		# If there isn't a resource found we stop.
		if @resource
			# Attempt to find a tag or create a new object from inbound arguments.
			@tag = Tag.find_or_create_by(tag: params[:tag].downcase)

			# Check if the tag has already been added to this resource.
			@tag_list = TagList.find_by(tag_id: @tag.id, resource_id: @resource.id)
			if @tag_list
				render :template => 'api/v1/errors/tag_duplicate', :status => 409

				# Return because if multiple render calls.
				return
			end

			# Is the tag valid, can I add it to the resources array of tags
			# and lastly: can I save the resource?
			if @tag.valid? && @resource.tags.push(@tag) && @resource.save
				render :template => 'api/v1/tags/show', :status => :created
			else
				render :template => 'api/v1/errors/tag', :status => :bad_request
			end
		else
		end
	end
	
	# GET /api/v1/tags.json
	# GET /api/v1/tags.xml
	def index
		# Check for optional limit parameter.
		if params[:limit].nil?
			params[:limit] = params[:default][:limit]
		end

		# GET /api/v1/tags
		@tags = Tag.paginate(:page => params[:page], :per_page => params[:limit])

		# GET api/v1/resources/:resource_id/tags
		# Return all tags used by a specific resource.
		if params[:resource_id]
			@tags = Resource.find_by(id: params[:resource_id]).tags.paginate(:page => params[:page])
		end
	end

	# GET /api/v/tags/{:tag_id}.json
	# GET /api/v/tags/{:tag_id}.xml
	def show
		@tag = Tag.find_by_id(params[:id])

		# If no tag was found with the
		# given id we return a formatted error.
		if @tag == nil
			self.RNFResponse
		end
	end

	# DELETE /api/v1/tag/{:tag_id}
	def destroy
		@tag_list = TagList.find_by(tag_id: params[:id], resource_id: params[:resource_id])

		# If no resource was found with the
		# given id we return a formatted error.
		if @tag_list == nil
			self.RNFResponse
		else
			# Destroy the resource.
			@tag_list.destroy

			# Get a reference to the tag object for the view.
			@tag = Tag.find_by(id: params[:id])

			# Render a template.
			render :template => 'api/v1/tags/destroy', :status => :ok
		end
	end
end