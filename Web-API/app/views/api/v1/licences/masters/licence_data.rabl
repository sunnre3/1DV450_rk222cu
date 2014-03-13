# Single licence.
object @licence

# Show URL to this specific licence
# unless explictly told not to.
#node (:href) { |r| api_v1_resource_url(r) } unless locals[:hide_url]

# Add attributes name and description.
attributes :licence_type, :created_at