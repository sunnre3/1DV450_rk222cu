# Build up a custom node tree.
object false

# Add the URL to this collection
# of resources.
node :self do |licence|
	url_for(:only_path => false, :overwrite_params=>nil)
end

# Add the collection of items
# as an array.
node :items do |licence|
	partial 'api/v1/licences/masters/instance', object: @licences, locals: { :link_label => 'href' }
end