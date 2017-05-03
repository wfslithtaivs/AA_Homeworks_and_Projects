require_relative 'question'
require_relative 'reply'
require_relative 'database'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'model_base'

class User < ModelBase
  attr_accessor :fname, :lname
  attr_reader :id

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? and lname = ?
    SQL
    data.map {|datum| User.new(datum) }
  end

  #INSTANCE METHODS
  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
    @id = options['id']
  end

  def authored_questions
    raise '#{self} not in database!' if @id.nil?
    Question.find_by_author_id(@id)
  end

  def authored_replies
    raise '#{self} not in database!' if @id.nil?
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        ROUND(COUNT(DISTINCT questions.id)/CAST(COUNT(question_likes.user_id) AS FLOAT), 2) AS average_karma
      FROM
        questions
      LEFT OUTER JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        questions.user_id = ?
    SQL
  end

  # def save
  #   @id.nil? ? create : update
  # end
  #
  # private
  #
  # def create
  #     QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
  #       INSERT INTO
  #         users (fname, lname)
  #       VALUES
  #         (?, ?)
  #     SQL
  #     @id = QuestionsDatabase.instance.last_insert_row_id
  #   end
  #
  #   def update
  #     QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
  #       UPDATE
  #         users
  #       SET
  #         fname = ?, lname = ?
  #       WHERE
  #         id = ?
  #     SQL
  #  end

end
