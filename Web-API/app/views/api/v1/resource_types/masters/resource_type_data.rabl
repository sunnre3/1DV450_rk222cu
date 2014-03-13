# Single resource.
object @resource_type

# Show URL to this specific resource
# unless explictly told not to.
#node (:href) { |r| api_v1_resource_url(r) } unless locals[:hide_url]

# Add attributes name and description.
attributes :resource_type => :type

node :resourceCount do |resource_type|
	Resource.where(resource_type_id: resource_type.id).count
end

# Finally glue in when the
# resource was created.
node :createdAt do |resource_type|
	resource_type.created_at
end