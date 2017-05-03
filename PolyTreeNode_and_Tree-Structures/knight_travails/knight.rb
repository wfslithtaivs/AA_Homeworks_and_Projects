require_relative '00_tree_node'
require 'byebug'

class KnightPathFinder
attr_reader :start, :visited_positions

  def initialize(pos)
      @start = PolyTreeNode.new(pos)
      @visited_positions = [pos]
      build_move_tree
  end
  # @visited_positions.include?(pos)
  def valid_moves(pos)
    x, y = pos
    coordinates = [[x + 1, y + 2], [x + 2, y + 1], [x + 2, y -1], [x + 1, y -2],
                  [x - 1, y + 2], [x - 2, y + 1], [x - 2, y - 1], [x - 1, y - 2]]
    coordinates.select {|pos| pos.all? {|el| legal_value(el)} }
  end

  def legal_value(num)
    num.between?(0,7)
  end

  def new_move_positions(pos)
    raise "Nill in visited positions" if visited_positions.nil?
    moves = valid_moves(pos).reject {|el| visited_positions.include?(el)}
    @visited_positions += moves unless moves.nil?
    moves
  end

  def start
    @start
  end

  def build_move_tree
    childque = [start]
    until childque.empty?
      current_node = childque.shift
      positions = new_move_positions(current_node.value)
      positions.each {|el| current_node.add_child(PolyTreeNode.new(el))}
      childque += current_node.children
    end
  end

  def trace_path_back(node)
    res = []
    current_node = node
    until current_node.parent.nil?
      res << current_node.value
      current_node = current_node.parent
    end
    (res << start.value).reverse
  end

  def find_path(target_pos)
    trace_path_back(@start.dfs(target_pos))
  end

  def print_moving_tree(str, node)
    p "#{node.value} #{str}"
    node.children.each do |child|
      print_moving_tree(str + "-> #{node.value}", child)
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  path = KnightPathFinder.new([0,0])
#  p path.new_move_positions([1,1])
#  p path.new_move_positions([5,3])
#  path.print_moving_tree("->", path.start)
  p path.find_path([7, 1])
end
