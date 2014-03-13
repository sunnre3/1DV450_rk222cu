# Build up a custom node tree.
object @tag

# Add the absolute URL to this
# particular resource.
node (locals[:link_label] || :self) do |tag|
	api_v1_tag_url(tag)
end

# The data node contains the
# data related to the resource.
node :data do |tag|
	partial 'api/v1/tags/masters/tag_data', object: tag
end

# Add some useful links.
node :links do |tag|
	{
		'resources' => api_v1_tag_resources_url(tag)
	}
end