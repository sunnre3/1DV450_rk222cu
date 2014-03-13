# Build up a custom node tree.
object @resource

# Add the absolute URL to this
# particular resource.
node (locals[:link_label] || :self) do |resource|
	api_v1_resource_url(resource)
end

# The data node contains the
# data related to the resource.
node :data do |resource|
	partial 'api/v1/resources/masters/resource_data', object: resource
end

# Add some useful links.
node :links do |resource|
	{
		:user => api_v1_user_url(resource.user),
		:tags => api_v1_resource_tags_url(resource),
		:resourceType => api_v1_resource_type_url(resource.resource_type),
		:licence => api_v1_licence_url(resource.licence)
	}
end