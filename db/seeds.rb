# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#country_list = [
#  [ "Deutschland", 81831000 ],
#  [ "Frankreich", 65447374 ],
#  [ "Belgien", 10839905 ],
#  [ "Niederlande", 16680000 ]
#]

#country_list.each do |country|
#  Country.create( :name => country[0], :population => country[1] )
#end

# user_list = [
# 	['username','name','email@email.com','location'],
# 	['eomwave','Moe','eomwave@gmail.com','New York']
# ]

# User.delete_all
# Wishlist.delete_all

# i=1

# user_list.each do |user|
# 	Wishlist.create
# 	User.create( 
# 		username: user[0],
# 	 	name: user[1],
# 	 	email: user[2],
# 	 	location: user[3],
# 	 	password: 'password',
# 	 	password_confirmatidon: 'password',
# 	 	wishlist_id: i
# 	 )
# 	i++
# end

project_list = [
	['header','description','image_url','1'],
	['Drop eggs from 20 stories high','description','image_url','1']
]

Project.delete_all

i=1

project_list.each do |project|
	Project.create!( 
		header: project[0],
	 	description: project[1],
	 	image_url: project[2],
	 	user_id: project[3]
	 )
	i++
end
