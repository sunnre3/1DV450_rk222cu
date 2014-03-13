# Build up a custom node tree.
object @resource_type

# Add the absolute URL to this
# particular resource.
node (locals[:link_label] || :self) do |resource_type|
	api_v1_resource_type_url resource_type
end

# The data node contains the
# data related to the resource.
node :data do |resource_type|
	partial 'api/v1/resource_types/masters/resource_type_data', object: resource_type
end

# Add some useful links.
node :links do |resource_type|
	{
		:resources => api_v1_resource_type_resources_url(resource_type)
	}
end