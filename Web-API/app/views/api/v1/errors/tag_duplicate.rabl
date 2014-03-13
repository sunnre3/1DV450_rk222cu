# Single tag.
object @tag

# Add the status code.
node :status do |tag|
	response.status
end

# Add the user friendly message.
node :message do |tag|
	'The tag you are trying to add has already been added to this resource.'
end

# Add a message to the developer to further
# help debugging.
node :developerMessage do |tag|
	'The user tried to add a tag that is already attached to this resource. tag_id: ' + @tag.id.to_s
end