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

user_list = [
	['username','name','email@email.com','location']
]

User.delete_all
user_list.each do |user|
	User.create( 
		username: user[0],
	 	name: user[1],
	 	email: user[2],
	 	location: user[3],
	 	password: 'password',
	 	password_confirmation: 'password',
	 	wishlist_id: 1
	 )
end