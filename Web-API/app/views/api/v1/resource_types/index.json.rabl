# Build up a custom node tree.
object false

node :collection do
	partial 'api/v1/resource_types/masters/collection', object: @resource_types
end