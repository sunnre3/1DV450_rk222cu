# Build up a custom node tree.
object false

# Use master.
node :instance do
	partial 'api/v1/licences/masters/instance', object: @licence
end