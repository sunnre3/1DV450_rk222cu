# Single resource.
object @tag

# Show URL to this specific resource
# unless explictly told not to.
#node (:href) { |r| api_v1_resource_url(r) } unless locals[:hide_url]

# Add attributes name and description.
attributes :id, :tag

# Finally glue in when the
# resource was created.
node :createdAt do |tag|
	tag.created_at
end