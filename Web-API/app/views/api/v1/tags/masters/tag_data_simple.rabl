# Single tag.
object @tag

# Add the attribute tag.
attributes :tag, :created_at

# Add the custom node URL
# which is an URL to the tag.
node :url do |t|
	api_v1_tag_url t
end