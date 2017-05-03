
require_relative 'piece'

class Bishop < Piece
  include Slidable

  def possible_moves
    diagonal_dirs
  end
end

class Rook < Piece
  include Slidable

  def possible_moves
    horizontial_dirs
  end
end

class Queen < Piece
  include Slidable

  def possible_moves
    diagonal_dirs + horizontial_dirs
  end

end
