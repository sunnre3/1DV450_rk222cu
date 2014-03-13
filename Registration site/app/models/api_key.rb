class ApiKey < ActiveRecord::Base
	# Set up relations.
	belongs_to :Application, :dependent => :destroy

	# Include module to generate a random
	# and unique API key.
	include Tokenable
end
