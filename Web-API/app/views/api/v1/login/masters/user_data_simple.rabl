# Single resource.
object @resource

# Add the URL to the resource.
node :href do |r|
	api_v1_resource_url r
end

# Add the name attribute.
node :name do |r|
	r.name
end

# Add what kind of resource it is.
node :resourceType do |r|
	r.getResourceType.resource_type
end

# Add the URL to where the resource
# is pointing.
node :url do |r|
	r.url
end