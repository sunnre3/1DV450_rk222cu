class Role < ActiveRecord::Base
	# Set up relations.
	has_many :users
end
