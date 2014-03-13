# Single resource.
object @resource

# Add the URL to the resource.
node :href do |resource|
	api_v1_resource_url(resource)
end

# Add the name attribute.
node :name do |resource|
	resource.name
end

# Add what kind of resource it is.
node :resourceType do |resource|
	resource.resource_type.resource_type
end

# Add the URL to where the resource
# is pointing.
node :url do |resource|
	resource.url
end