# encoding: UTF-8
class User < ActiveRecord::Base
	# Set up relations.
	has_many :application
	belongs_to :role

	# Adds password helper.
	has_secure_password

	# Checks if user is SU or not.
	def isAdmin
		return self.role.id == 1
	end

	# Validation rules for email.
	validates :email,
		:uniqueness => true,
		:presence => true,
		:format		=> {
			:with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
		}
end
