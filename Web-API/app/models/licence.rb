class Licence < ActiveRecord::Base
	# Set up relations.
	has_many :resource

	# Validates presence of licence.
	validates_presence_of :licence_type
end