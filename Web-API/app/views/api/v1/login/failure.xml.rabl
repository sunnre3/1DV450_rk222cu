# Object false to build a
# custom node tree.
object false => 'error'

# Add the status code.
node :status do |node|
	response.status 
end

# Add the user friendly message.
node :message do |node|
	'The username and password doesn\'t match.'
end

# Add the message dedicated to
# developers recieving this error.
node :developerMessage do |node|
	'It seems the user provided the invalid credentials.'
end

# Add some useful links.
node :links do |node|
	{
		'documentation' => 'http://dummy.link/documentation'
	}
end