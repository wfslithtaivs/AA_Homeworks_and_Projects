require 'byebug'
require 'colorize'

class Piece
  attr_reader :name
  attr_accessor :color

  def initialize(color = :black, name = nil)
    @name = name
    @color = color
  end

  def to_s
    @name
  end

  def nil?
    @name.nil?
  end

  def empty?
  end

  def symbol
  end

  def valid_moves

  end

  def moves(pos)
    []
  end

  private
  def move_into_check(to_pos)
  end
end

module Slidable
  def moves(pos)
    mvs = []
    possible_moves.each do |p_pos|
      mvs << [p_pos[0] + pos[0], p_pos[1] + pos[1]]
    end
    mvs
  end

  private

  def move_dirs
  end

  def horizontial_dirs
    mvs = []
    (1..7).each do |i|
      mvs << [0, i]
      mvs << [i, 0]
      mvs << [0, -i]
      mvs << [-i, 0]
    end
    mvs
  end

  def diagonal_dirs
    mvs = []
    (1..7).each do |i|
      mvs << [i, i]
      mvs << [i, -i]
      mvs << [-i, i]
      mvs << [-i, -i]
    end
    mvs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end

end

module Stepable
  def moves(pos)
    mvs = []
    possible_moves.each do |p_pos|
      mvs << [p_pos[0] + pos[0], p_pos[1] + pos[1]]
    end
    mvs
  end

  private

  def move_dirs
  end
end
