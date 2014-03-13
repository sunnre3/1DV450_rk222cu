# Single resource.
object @resource

# Add the status code.
node :status do |resource|
	response.status
end

# Add a user friendly message.
node :message do |resource|
	'The resource was successfully deleted.'
end

# Add a message to the developer.
node :developerMessage do |resource|
	'The resource with an id of \'' + resource.id.to_s + '\' was deleted.'
end