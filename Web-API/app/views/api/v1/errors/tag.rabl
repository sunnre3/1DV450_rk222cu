# Single tag.
object @tag

# Add the status code.
node :status do |tag|
	response.status
end

# Add the user friendly message.
node :message do |tag|
	pluralize(@tag.errors.count, 'error') + ' has occured while trying to process your request. Correct these and try again.'
end

# Add a message to the developer to further
# help debugging.
node :developerMessage do |tag|
	'The user supplied some wrong arguments while trying to save this resource.'
end

# Add the validation errors themselves.
node :errors do |tag|
	tag.errors.full_messages
end