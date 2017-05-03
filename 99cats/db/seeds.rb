# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


names = ['Cat', 'SuperCat', 'AverageCat']
colors = ['white', 'black', 'orange', 'blank']
sexez = ['M', 'F', 'B']

10.times {|i| Cat.create!({name: names.sample + i.to_s,
                      birth_date: Time.now,
                      color: colors.sample,
                      sex: sexez.sample,
                      description: 'What do you want to know about #{names.sample}?'})}
