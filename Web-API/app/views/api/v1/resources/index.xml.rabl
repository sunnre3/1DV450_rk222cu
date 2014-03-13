# Build up a custom node tree.
object false => :resources

node :collection do
	partial 'api/v1/resources/masters/collection', object: @resources
end