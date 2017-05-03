require_relative 'database'

class ModelBase

  attr_reader :id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = ?
    SQL
    self.new(data.first)
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM #{table}")
    data.map {|datum| self.new(datum) }
  end

  def save
    @id.nil? ? create : update
  end

  def create
    p get_local_vars
    QuestionsDatabase.instance.execute(<<-SQL, get_local_vars)
      INSERT INTO
        #{self.class.table} (#{get_insert_params})
      VALUES
        (#{get_question_marks})
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

    def update
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
        UPDATE
          users
        SET
          fname = ?, lname = ?
        WHERE
          id = ?
      SQL
   end

   private

  def self.table
    if self == User
      return 'users'
    elsif self == Question
      return 'questions'
    elsif self == Reply
      return 'replies'
    end
  end

  def get_question_marks
    a = []
    len = self.instance_variables.length - 1
    len.times { a << '?' }
    p a.join(', ')
    a.join(', ')
  end

  def get_insert_params
    s = self.instance_variables
    "#{s[0..-2].map {|str| str.to_s[1..-1]}.join(', ')}"
  end

  def get_local_vars
    s = self.instance_variables
    "#{s[0..-2].map {|str| str.to_s}.join(", ")}"
  end

end
