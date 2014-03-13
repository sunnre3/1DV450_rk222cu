# Single resource.
object @resource

# Add the status code.
node :status do |resource|
	response.status
end

# Add the user friendly message.
node :message do |resource|
	pluralize(@resource.errors.count, 'error') + ' has occured while trying to process your request. Correct these and try again.'
end

# Add a message to the developer to further
# help debugging.
node :developerMessage do |resource|
	'The user supplied some wrong arguments while trying to save this resource.'
end

# Add the validation errors themselves.
node :errors do |resource|
	resource.errors.full_messages
end