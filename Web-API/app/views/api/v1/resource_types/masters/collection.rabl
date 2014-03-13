# Build up a custom node tree.
object false

# Add the URL to this collection
# of resources.
node :self do |resource_type|
	url_for(:only_path => false, :overwrite_params=>nil)
end

# Add the collection of items
# as an array.
node :items do |resource_type|
	partial 'api/v1/resource_types/masters/instance', object: @resource_types, locals: { :link_label => 'href' }
end
