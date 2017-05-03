require_relative 'question'
require_relative 'user'
require_relative 'database'

class QuestionFollow

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SElECT
        users.*
      FROM
        users
        JOIN question_follows
          ON users.id = question_follows.user_id
      WHERE
        question_follows.question_id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SElECT
        questions.*
      FROM
        questions
        JOIN question_follows
          ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SElECT
        questions.*
      FROM
        questions
        JOIN question_follows
          ON questions.id = question_follows.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(DISTINCT question_follows.user_id) DESC
      LIMIT ?
    SQL
    data.map { |datum| Question.new(datum) }
  end
end
