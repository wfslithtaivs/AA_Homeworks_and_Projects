require 'byebug'
require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos, :kids
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @kids = []
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    mark = @next_mover_mark == :x ? :o : :x
    board.rows.each_with_index do |row, idx|
      row.each_index do |index|
        pos = [idx, index]
        board_next = board.dup
        if board_next[pos].nil?
          board_next[pos] = next_mover_mark
          @kids.push(TicTacToeNode.new(board_next, mark, pos))
        end
      end
    end
    return kids
  end

end

if __FILE__ == $PROGRAM_NAME
  a = TicTacToeNode.new(Board.new, :x)
  p a.children
  p a.kids.length
end
