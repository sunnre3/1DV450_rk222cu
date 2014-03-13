class Tag < ActiveRecord::Base
	# Set up relations.
	has_many :tag_lists
	has_many :resources, through: :tag_lists

	# Validates presence of all tag.
	validates_presence_of :tag
end
