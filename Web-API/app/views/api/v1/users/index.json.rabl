# Build up a custom node tree.
object false

node :collection do
	partial 'api/v1/users/masters/collection', object: @users
end