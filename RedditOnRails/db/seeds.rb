# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


sub1 = Sub.new(title: "Cooking", description: "How to cook something", user_id: 4)
sub1.save
  post1 = Post.new(title: "Eggs", url: "http://wfslithtaivs.github.io/recepies/", sub_id: Sub.last.id)
  post1.save
  post2 = Post.new(title: "Tea", url: "https://en.wikipedia.org/wiki/Tea", sub_id: Sub.last.id)
  post2.save
  post3 = Post.new(title: "Else", url: "http://www.dictionary.com/browse/else", sub_id: Sub.last.id)
  post3.save

sub2 = Sub.new(title: "Climbing", description: "How to climb somewhere", user_id: 1)
sub2.save
  post4 = Post.new(title: "Hill", url: "https://www.youtube.com/watch?v=wYY0KqhaIBU", sub_id: Sub.last.id)
  post4.save
  post5 = Post.new(title: "Mountain", url: "https://en.wikipedia.org/wiki/Mountain_bike", sub_id: Sub.last.id)
  post5.save
  post6 = Post.new(title: "Wall", url: "www.imdb.com/title/tt3784160/", sub_id: Sub.last.id)
  post6.save

sub3 = Sub.new(title: "BashOrg", description: "How to bashorg sometimes", user_id: 4)
sub3.save
  post7 = Post.new(title: "For fun", url: "http://bash.org/?add", sub_id: Sub.last.id)
  post7.save
  post8 = Post.new(title: "Admin jokes", url: "http://bash.org/?random", sub_id: Sub.last.id)
  post8.save

sub4 = Sub.new(title: "Ubuntu", description: "How to ubuntu without cry", user_id: Sub.last.id)
sub4.save
  post8 = Post.new(title: "Keep coding", url: "http://ubunty.org/", sub_id: Sub.last.id)
  post8.save
