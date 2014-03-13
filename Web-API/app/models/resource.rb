class Resource < ActiveRecord::Base
	# Set up relations.
	has_many :tag_lists, :autosave => true
	has_many :tags, through: :tag_lists, :autosave => true
	belongs_to :licence
	belongs_to :resource_type
	belongs_to :user

	# Validates the foreign keys.
	validates :licence, :resource_type, :user, :presence => { :message => 'has to be a valid id' }

	# Validates the regular properties.
	validates :name, :description, :url, :presence => true

	# Returns all resources if no search term is provided
	# but if it is then return any resources found.
	def self.search(search)
		if search
			where('name LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%")
		else
			all
		end
	end
end