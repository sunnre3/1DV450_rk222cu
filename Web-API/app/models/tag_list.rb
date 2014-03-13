class TagList < ActiveRecord::Base
	# Set up relations.
	belongs_to :tag
	belongs_to :resource
end
