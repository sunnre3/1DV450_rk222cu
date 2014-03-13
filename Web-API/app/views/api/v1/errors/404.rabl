# Object false to build a
# custom node tree.
object false => 'error'

# Add the status code.
node :status do |node|
	response.status 
end

# Add the user friendly message.
node :message do |node|
	'Duh! The URL you requested doesn\'t seem to exist!'
end

# Add the message dedicated to
# developers recieving this error.
node :developerMessage do |node|
	'The resource ' + '\'' + request.original_url + '\' does not exist.'
end

# Add some useful links.
node :links do |node|
	{
		'documentation' => 'http://dummy.link/documentation'
	}
end