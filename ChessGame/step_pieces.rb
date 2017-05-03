
require_relative 'piece'

class King < Piece
  include Stepable

  def possible_moves
    [[-1, 1], [-1, 0], [0, 1], [0, -1],
    [-1, -1], [1, 1], [1, -1], [1, 0]]
  end

end


class Knight < Piece
  include Stepable

  def possible_moves
    [[-1, 2], [1, 2], [-2, 1], [2, 1],
    [-2, -1], [2, -1], [-1, -2], [1, -2]]
  end

end
