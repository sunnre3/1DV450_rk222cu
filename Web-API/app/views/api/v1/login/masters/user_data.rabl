# Single user.
object @user

# Show URL to this specific resource
# unless explictly told not to.
#node (:href) { |r| api_v1_resource_url(r) } unless locals[:hide_url]

# Add attributes name and description.
attributes :id, :firstname, :surname, :email

# Add the number of resources created
# by the user.
node :resourcesCount do |user|
	user.resources.count
end

# Finally glue in when the
# resource was created.
glue @user do
	attributes :created_at => :createdAt
end