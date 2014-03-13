# Build up a custom node tree.
object false

node :collection do
	partial 'api/v1/resources/masters/collection', object: @resources
end

