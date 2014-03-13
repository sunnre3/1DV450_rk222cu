class User < ActiveRecord::Base
	# Set up relations.
	has_many :resources

	# Use has_secure_password.
	has_secure_password

	# Validate presence for all fields.
	validates_presence_of :firstname,
		:surname, :email, :password, :password_confirmation

	# Validates email for correct format.
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
