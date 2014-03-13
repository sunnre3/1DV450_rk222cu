# Single resource.
object @resource

# Show URL to this specific resource
# unless explictly told not to.
#node (:href) { |r| api_v1_resource_url(r) } unless locals[:hide_url]

# Add attributes name and description.
attributes :name, :description

# Add what kind of resource it is.
node :resourceType do |resource|
	resource.resource_type.resource_type
end

# Add the URL to where the resource
# is pointing.
node :url do |resource|
	resource.url
end

# Add the user's email.
node :user do |resource|
	resource.user.email
end

# Add the type of licence.
node :licence do |resource|
	resource.licence.licence_type
end

# Add an array of all tags
# associated.
#child :tags do
#	extends 'api/v1/tags/masters/tag_data_simple'
#end

# Finally glue in when the
# resource was created.
glue @resource do
	attributes :created_at => :createdAt
end