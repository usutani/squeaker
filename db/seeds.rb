# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create! username: "_why"
u.messages.create! content: "I am making dinner"
u.messages.create! content: "I just wokr up"
u.messages.create! content: "I am goint to work"
