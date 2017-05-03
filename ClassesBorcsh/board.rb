require_relative "card.rb"

class Board

  attr_accessor :board, :size, :current_state, :shuffled_cards

  def initialize(size = 4)
    @board = Array.new(size) {Array.new(size)}
    @size = size
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def populate(shuffled_cards)
    @board.each_with_index do |array, row_index|
      array.each_with_index do |el, col_index|
        pos = [row_index, col_index]
         card_popped = shuffled_cards.pop
         self[pos] = card_popped
      end
    end
    self
  end

  def open
    @board.each_with_index do |array, row_index|
      array.each_with_index do |el, col_index|
        pos = [row_index, col_index]
         reveal(pos)
      end
    end
  end

  def render
  #  system("clear")
    boarder = "+#{"-"*(@board.length*3)}+"
    p boarder
    @board.each_with_index do |array, row_index|
      print " |"
      array.each_with_index do |el, col_index|
        pos = [row_index, col_index]
        card = self[pos]
        if card.state
          print " #{card.to_s} "
        else
          print " - "
        end
      end
      print "|"
      print "\n"
    end
    p boarder
  end

  def won?
    @board.flatten.all? {|el| el.state}
  end

  def board_to_a
    arr  = Array.new(@size) {Array.new(@size)}
    @board.each_with_index do |array, row_index|
      array.each_with_index do |el, col_index|
        pos = [row_index, col_index]
        val = self[pos].to_s
        arr[row_index][col_index] = self[pos].state ? val : "."
      end
    end
    arr
  end

  def reveal(guessed_pos)
    card  = self[guessed_pos]
    card.reveal if !card.state
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  c1 = Card.new("a")
  c1.reveal
  c2 = Card.new("b")
  c3 = Card.new("c")
  c3.reveal
  deck_of_cards = [c1, c2, c3, c2.dup,
                  c1.dup, c2.dup, c3.dup, c1.dup,
                  c2.dup, c1, c2.dup, c1.dup,
                  c2.dup, c3.dup, c1.dup, c2.dup]
  b.populate(deck_of_cards)
  b.render
  b.reveal([0,0])
  b.render
  p b.won?
  b.reveal([1,0])
  b.render
  p b.won?
end
