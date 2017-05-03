require_relative 'database'
require_relative 'user'
require_relative 'question'
require_relative 'reply'
require_relative 'question_follow'
require_relative 'question_like'
#
# p User.all
# p Question.all
# p Reply.all

quest = Question.find_by_author_id(2)
# p "Question: Find by author #{quest}"
repl = Reply.find_by_user_id(1)
# p " Reply: Find by user id :  ------ #{repl}"
# p " Reply: Find by question id:  ------ #{Reply.find_by_question_id(1)}"

user = User.find_by_name('Ian', 'H').first
# p user

# p user.authored_questions
# p user.authored_replies
# p quest.first.author
# p quest.first.replies
# p repl.first.author
# p repl.first.question
# p repl.first.parent_reply
# p "repl: #{repl.first}"
# p "Child replies: #{repl.first.child_replies}"
#
# puts "\nMedium Weird Mode\n"
# puts "Followers for question ID: #{QuestionFollow.followers_for_question_id(1)}\n"
# puts "Followed questions for user ID: #{QuestionFollow.followed_questions_for_user_id(1)}\n"
# puts "Followed questions: #{user.followed_questions}"
# puts "Followers: #{quest.first.followers}"


puts "\nHard Mode\n"
# puts "Most followed questions: #{QuestionFollow.most_followed_questions(2)}"
# puts "Question.most_followed: #{Question.most_followed(1)}"
# puts "Likers for question: #{QuestionLike.likers_for_question_id(1)}"
# puts "Num likes for question: #{QuestionLike.num_likes_for_question_id(1)}"
# puts "Liked questions for user: #{QuestionLike.liked_questions_for_user_id(3)}"
# puts "Question.likers: #{quest.first.likers}"
# puts "Question.num_likes: #{quest.first.num_likes}"
# puts "User.liked_questions: #{user.liked_questions}"

# repl = Reply.find_by_id(2)
# p User.all
#
# p repl.instance_variables

# p usr.average_karma
#
usr2 = User.new( {'fname' => "Someone", 'lname' => "Else"} )
usr2.save
# usr2.fname = 'Ian'
# usr2.save
#
# p User.all
#
# quest2 = Question.new( 'title' => "Awesome Ttitle", 'body' => "Super Body", 'user_id' => usr2.id)
# quest2.save
# p Question.all
#
# repl2 = Reply.new( 'question_id' => quest2.id, 'parent_id' => nil, 'user_id' => usr.id, 'body' => "I''m in TEST")
# repl2.save
# p Reply.all
