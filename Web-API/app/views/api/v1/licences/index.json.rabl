# Build up a custom node tree.
object false

node :collection do
	partial 'api/v1/licences/masters/collection', object: @licences
end