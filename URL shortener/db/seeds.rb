# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.new(email: 'kates')
user1.save if user1.valid?
user2 = User.new(email: 'cristine')
user2.save if user2.valid?
user3 = User.new(email: 'skeletons')
user3.save if user3.valid?

long_url = "whereismybanana"
shortener1 = ShortenedUrl.random_code(user1, long_url)
# shortener1.save if shortener1.valid?
Visit.record_visit!(user1, shortener1)

long_url = "hereitis"
Visit.record_visit!(user3, ShortenedUrl.random_code(user3, long_url))
