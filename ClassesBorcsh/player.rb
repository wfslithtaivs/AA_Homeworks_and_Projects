class Player

  attr_accessor :name, :scores

  def initialize(name = "Human")
    @name = name
    @scores = 0
  end

  def prompt(line)
    print "Dear #{@name}, please, #{line}"
    gets.chomp
  end

end
