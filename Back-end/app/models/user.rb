# encoding: UTF-8

class User < ActiveRecord::Base
	# Adds password helper.
	has_secure_password

	# Validates presence for all fields.
	validates_presence_of :firstname, :surname, :email

	# Validation rules for email.
	validates :email, :uniqueness => true,
		:format		=> {
			:with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
		}
end
