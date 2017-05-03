# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create([{ name: 'Star Wars', email: 'StarMail' }, { name: 'Lord of the Rings', email: 'LordOfTheMails' }])

User.create([{username: 'VanGogh'}, {username: 'Dali'}, {username: 'Sesan'}, {username: 'Leonardo'}])

arts = Artwork.create([{title: 'Mona Lisa', image_url: 'some url', artist_id: 9},
                {title: 'Mona Not That Lisa', image_url: 'some url', artist_id: 10},
                {title: 'Mona Not At All Lisa', image_url: 'some url', artist_id: 11}])
arts.each do |art|
  art.save unless !art.valid?
end

artshar = Artshare.create([{artwork_id: 1, viewer_id: 9}, {artwork_id: 1, viewer_id: 10}, {artwork_id: 2, viewer_id: 12}])
artshar.each do |art|
  art.save unless !art.valid?
end
