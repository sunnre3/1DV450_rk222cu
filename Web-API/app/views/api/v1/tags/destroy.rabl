# Single resource.
object @tag

# Add the status code.
node :status do |tag|
	response.status
end

# Add a user friendly message.
node :message do |tag|
	'The tag was successfully deleted.'
end

# Add a message to the developer.
node :developerMessage do |tag|
	'The tag with an id of \'' + tag.id.to_s + '\' was deleted.'
end