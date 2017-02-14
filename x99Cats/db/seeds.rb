# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


cat1 = Cat.create!(name: 'Garfield', color: 'Orange', sex: 'M', birth_date: '01-01-1990' )
cat2 = Cat.create!(name: 'Gary', color: 'Brown', sex: 'M', birth_date: '06-01-2004' )
