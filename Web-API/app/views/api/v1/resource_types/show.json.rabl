# Build up a custom node tree.
object false

# Use master.
node :instance do
	partial 'api/v1/resource_types/masters/instance', object: @resource_type
end