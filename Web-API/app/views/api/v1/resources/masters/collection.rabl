# Build up a custom node tree.
object false

# Add the URL to this collection
# of resources.
node :self do |r|
	url_for(:only_path => false, :overwrite_params=>nil)
end

# Add the collection of items
# as an array.
node :items do |r|
	partial 'api/v1/resources/masters/instance', object: @resources, locals: { :link_label => 'href' }
end

# Add pagination links and info.
node :pagination do
	partial 'api/v1/resources/masters/pagination', object: @resources
end