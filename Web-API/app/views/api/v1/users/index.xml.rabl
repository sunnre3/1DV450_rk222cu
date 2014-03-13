# Build up a custom node tree.
object false => :resources

node :collection do
	partial 'api/v1/users/masters/collection', object: @users
end