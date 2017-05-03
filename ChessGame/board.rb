require_relative 'piece'
require_relative 'null_piece'
require_relative 'slide_pieces'
require_relative 'step_pieces'
require_relative 'paws'
require 'byebug'

class Board
  W_INITIAL_LINE = ["\u2656", "\u2658", "\u2657", "\u2654", "\u2655", "\u2657", "\u2658", "\u2656"]
  B_INITIAL_LINE = ["\u265C", "\u265E", "\u265D", "\u265B", "\u265A", "\u265D", "\u265E", "\u265C"]

  attr_accessor :board

  def initialize
    @board = Array.new(8) {
      Array.new(8) { NullPiece.instance }
    }
    make_starting_grid
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def occupied?(pos)
    !(self[pos].class == NullPiece)
  end

  def move_piece(color, from_pos, to_pos)
    if valid_from?(from_pos) && valid_to?(to_pos) && self[from_pos].moves(from_pos).include?(to_pos)
      # we don't know yet
      move_piece!(from_pos, to_pos)
    else
      puts "Wrong way \u26D4"
    end

    if in_check?(color)
      puts "Check mate! \u2639"
      move_piece!(from_pos, to_pos)
    end
  end

  def move_piece!(from_pos, to_pos)
    self[to_pos], self[from_pos] = self[from_pos], self[to_pos]
  end

  def valid_from?(pos)
    valid_pos?(pos) && occupied?(pos)
  end

  def valid_to?(pos)
        # we need to chang this part
    valid_pos?(pos) && !occupied?(pos)
  end

  def valid_pos?(pos)
    pos.all? do |ele|
      ele.between?(0,7)
    end
  end

  def in_bounds?(pos)
    valid_pos?(pos)
  end

  def in_check?(color)
    king_pos = find_king(color)
    trace_color = color == :red ? :blue : :red
    trace_pieces(trace_color).include?(king_pos)
  end

  def trace_pieces(color)
    positions = []

    (0..7).each do |x|
      (0..7).each do |y|
        positions << [x, y] if self[[x, y]].color == color
      end
    end

    coverage = []
    positions.each do |pos|
      coverage += self[pos].moves(pos)
    end

    coverage
  end

  def checkmate?(color)
    in_check(color) && trace_pieces(color).empty?
  end

  def dup
    dup_board = Board.new

    (0..7).each do |x|
      (0..7).each do |y|
        pos = [x, y]
        # dup_board[pos] = @self[pos].dup
        if self[pos].class == NullPiece
          dup_board[pos] = NullPiece.instance
        else
          dup_board[pos] = @self[pos].class.new(@self[pos].color, @self[pos].name )
        end
      end
    end
    dup_board
  end

  protected

  def make_starting_grid
    @board[0][0] = Rook.new(:red, W_INITIAL_LINE[0] )
    @board[0][1] = Knight.new(:red, W_INITIAL_LINE[1] )
    @board[0][2] = Bishop.new(:red, W_INITIAL_LINE[2] )
    @board[0][3] = King.new(:red, W_INITIAL_LINE[3] )
    @board[0][4] = Queen.new(:red, W_INITIAL_LINE[4] )
    @board[0][5] = Bishop.new(:red, W_INITIAL_LINE[5] )
    @board[0][6] = Knight.new(:red, W_INITIAL_LINE[6] )
    @board[0][7] = Rook.new(:red, W_INITIAL_LINE[7] )
    0.upto(7) {|i| @board[1][i] = Paw.new(:red, "\u2659") }
    # 2.upto(5) {|i| 0.upto(7) {|idx| @board[i][idx] = NullPiece.instance} }
    0.upto(7) {|i| @board[6][i] = Paw.new(:blue, "\u265F") }
    @board[7][0] = Rook.new(:blue, B_INITIAL_LINE[0] )
    @board[7][1] = Knight.new(:blue, B_INITIAL_LINE[1] )
    @board[7][2] = Bishop.new(:blue, B_INITIAL_LINE[2] )
    @board[7][3] = King.new(:blue, B_INITIAL_LINE[3] )
    @board[7][4] = Queen.new(:blue, B_INITIAL_LINE[4] )
    @board[7][5] = Bishop.new(:blue, B_INITIAL_LINE[5] )
    @board[7][6] = Knight.new(:blue, B_INITIAL_LINE[6] )
    @board[7][7] = Rook.new(:blue, B_INITIAL_LINE[7] )
  end

  def find_king(color)
    (0..7).each do |x|
      (0..7).each do |y|
        return [x, y] if self[[x, y]].is_a?(King) && self[[x, y]].color == color
      end
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  b = Board.new
  p b.in_check?(:red)
  # p b.trace_pieces(:blue)
  b.move_piece!([0, 3], [5,4])
  p b.in_check?(:red)
  # p b.trace_pieces(:blue)
end
