# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create a SU role.
Role.create(role: 'SU')

# Create a normal user role.
Role.create(role: 'Normal')

# Create a SU.
User.create(email: 'admin@this.com', password: '123', password_confirmation: '123', role_id: 1)