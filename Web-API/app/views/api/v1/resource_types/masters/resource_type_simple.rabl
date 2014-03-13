# Single tag.
object @resource_type

# Add the attribute tag.
attributes :resource_type, :created_at

# Add the custom node URL
# which is an URL to the tag.
node :url do |resource_type|
	api_v1_resource_type_url resource_type
end