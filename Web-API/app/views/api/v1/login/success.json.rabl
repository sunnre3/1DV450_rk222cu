# Object false to build a
# custom node tree.
object false => 'success'

# Add the status code.
node :status do |node|
	response.status 
end

node :data do |node|
{
	:userId => @id,
	:token => @token
}
end

# Add the user friendly message.
node :message do |node|
	'You have successfully logged in.'
end

# Add the message dedicated to
# developers recieving this error.
node :developerMessage do |node|
	'The user has successfully logged in with their credentials.'
end

# Add some useful links.
node :links do |node|
	{
		'documentation' => 'http://dummy.link/documentation'
	}
end