class ResourceType < ActiveRecord::Base
	# Set up relations.
	has_many :resources

	# Validates presence of resource_type.
	validates_presence_of :resource_type
end
