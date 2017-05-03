require 'byebug'
class PolyTreeNode

  def initialize(value = nil)
    @value, @parent, @children = value, nil, []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node = nil)
    # delete self from parent's children
    @parent.children.delete(self) if !@parent.nil?
    # set parent for self
    @parent = node
    #
    node.children << self unless node.nil?
  end

  def add_child(child)
    # check if child already exists
    if !@children.include?(child)
      # set self as a perent of a new child
      child.parent = self unless child.nil?
    end
  end

  def remove_child(child)
    @children.delete(child) {raise "Not a child"}
    child.parent = nil unless child.nil?
  end

  # reqursive dfs
  def dfs(target_value)
    # return self if target is here
    return self if @value == target_value
    # return nil if leaf doesn't contain target
    return nil if self.children.empty?
    # seach over children
    @children.each do |child|
      # search over children's children
      result = child.dfs(target_value)
      # return result of a deep search
      return result unless result.nil?
    end
    # return nill if nothing
    nil
  end

  def bfs(target_value)
    # initializing queue and put root element into queue
    childque = [self]
    # until no more nodes left
    until childque.empty?
      # set a current node
      current_node = childque.shift
      # process current node and return if goal met
      return current_node if current_node.value == target_value
      # iterate over current_node childrens putting them into queue if they are
      current_node.children.each {|el| childque.push(el)}
    end
    # return nill if nothing
    nil
  end

end
