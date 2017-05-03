# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: 'Katerina')
user2 = User.create(name: 'Vu')
user3 = User.create(name: 'Robert')

poll1 = Poll.create(title: 'Pizza Poll', author_id: user1.id)
poll2 = Poll.create(title: 'Vacation Poll', author_id: user2.id)


question1 = Question.create(question: 'Do you like pizza?', poll_id: poll1.id)
question2 = Question.create(question: 'What is your favorite pizza topping?', poll_id: poll1.id)
question3 = Question.create(question: 'Where do you want to go next spring?', poll_id: poll2.id)
question4 = Question.create(question: 'Who do you want to go on vacation with?', poll_id: poll2.id)

15.times do |i|
  AnswerChoice.create(answer: 'Yes ' * i, question_id: question1.id)
end

5.times do |i|
  AnswerChoice.create(answer: 'Nope ' * i, question_id: question2.id)
end

5.times do |i|
  AnswerChoice.create(answer: 'Whyyy ' * i,  question_id: question3.id)
end

5.times do |i|
  AnswerChoice.create(answer: 'Hey, no! ' * i, question_id: question4.id)
end
