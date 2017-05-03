require_relative 'question'
require_relative 'reply'
require_relative 'user'
require_relative 'database'
require_relative 'question_follow'

class QuestionLike

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
        JOIN question_likes
          ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*)
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL
    data.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
        JOIN question_likes
          ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SElECT
        questions.*
      FROM
        questions
        JOIN question_likes
          ON questions.id = question_likes.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(DISTINCT question_likes.user_id) DESC
      LIMIT ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

end
