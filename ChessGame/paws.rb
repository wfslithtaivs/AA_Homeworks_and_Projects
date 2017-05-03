require_relative 'piece'
require 'byebug'

class Paw < Piece

  def possible_moves
    if @color == :red
      [[1, 0], [2, 0]]
    else
      [[-1, 0], [-2, 0]]
    end
  end

  def moves(pos)
    mvs = []
    possible_moves.each do |p_pos|
      mvs << [p_pos[0] + pos[0], p_pos[1] + pos[1]]
    end
    return mvs[0] unless at_start?(pos)
    mvs
  end

  def at_start?(pos)
    (@color == :red && pos[0] == 1) || (@color == :blue && pos[0] == 6)
  end
end
