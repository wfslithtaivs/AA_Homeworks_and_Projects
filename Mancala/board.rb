require 'byebug'

class Board
  attr_accessor:cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) {Array.new}
    initial_filling
  end

  def initial_filling
    @cups[0..5].each_index {|i| @cups[i] += [:stone, :stone, :stone, :stone]}
  end
end
