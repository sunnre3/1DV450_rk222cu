# Build up a custom node tree.
object false => :tags

node :collection do
	partial 'api/v1/tags/masters/collection', object: @tags
end