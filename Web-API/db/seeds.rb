# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create an APITester
User.create(firstname: 'John', surname: 'Doe', email: 'john.doe@email.com', password: '123', password_confirmation: '123')

# Create different licence types.
Licence.create(licence_type: 'MIT')
Licence.create(licence_type: 'Creative Commons')
Licence.create(licence_type: 'GNU')

# Create different resource types.
ResourceType.create(resource_type: 'Image')
ResourceType.create(resource_type: 'Video')
ResourceType.create(resource_type: 'Audio')
ResourceType.create(resource_type: 'Note')

# Create test resources.
Resource.create(
	resource_type_id: 1,
	user_id: 1,
	licence_id: 1,
	name: 'Bildresurs',
	url: 'http://shiturl.se/',
	description: 'En asbra beskrivning!'
)
Resource.create(
	resource_type_id: 2,
	user_id: 1,
	licence_id: 1,
	name: 'Videoresurs',
	url: 'http://shiturl.se/',
	description: 'En asbra beskrivning!'
)
Resource.create(
	resource_type_id: 2,
	user_id: 1,
	licence_id: 3,
	name: 'Ljudresurs',
	url: 'http://shiturl.se/',
	description: 'En asbra beskrivning!'
)
Resource.create(
	resource_type_id: 3,
	user_id: 1,
	licence_id: 2,
	name: 'Anteckningsresurs',
	url: 'http://shiturl.se/',
	description: 'En asbra beskrivning!'
)

# Add tags.
Tag.create(tag: 'Sol')
Tag.create(tag: 'Sommar')
Tag.create(tag: '2014')
Tag.create(tag: 'Användbart')

# Add some TagLists.
TagList.create(tag_id: 1, resource_id: 1)
TagList.create(tag_id: 2, resource_id: 1)
TagList.create(tag_id: 3, resource_id: 1)
TagList.create(tag_id: 4, resource_id: 1)
TagList.create(tag_id: 1, resource_id: 2)
TagList.create(tag_id: 2, resource_id: 2)
TagList.create(tag_id: 3, resource_id: 2)
TagList.create(tag_id: 4, resource_id: 2)
TagList.create(tag_id: 1, resource_id: 3)
TagList.create(tag_id: 2, resource_id: 3)
TagList.create(tag_id: 3, resource_id: 3)
TagList.create(tag_id: 4, resource_id: 3)
TagList.create(tag_id: 1, resource_id: 4)
TagList.create(tag_id: 2, resource_id: 4)
TagList.create(tag_id: 3, resource_id: 4)
TagList.create(tag_id: 4, resource_id: 4)