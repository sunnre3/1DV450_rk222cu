# Build up a custom node tree.
object @licence

# Add the absolute URL to this
# particular resource.
node (locals[:link_label] || :self) do |licence|
	api_v1_licence_url(licence)
end

# The data node contains the
# data related to the resource.
node :data do |licence|
	partial 'api/v1/licences/masters/licence_data', object: licence
end

# Add some useful links.
node :links do |licence|
	api_v1_licence_resources_url(licence)
end