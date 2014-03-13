# Build up a custom node tree.
object @user

# Add the absolute URL to this
# particular resource.
node (locals[:link_label] || :self) do |user|
	api_v1_user_url user
end

# The data node contains the
# data related to the resource.
node :data do |user|
	partial 'api/v1/users/masters/user_data', object: user
end

# Add some useful links.
node :links do |user|
	{
		:resources => api_v1_user_resources_url(user)
	}
end