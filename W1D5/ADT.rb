class Stack
  def initialize
    # create ivar to store stack here!
    @stack = Array.new
  end

  def add(el)
    # adds an element to the stack
    @stack.push(el)
  end

  def remove
    # removes one element from the stack
    @stack.pop
  end

  def show
    # return a copy of the stack
    @stack.clone
  end
end


class Queue
  def initialize
    # create ivar to store queue here!
    @queue = Array.new
  end

  def enqueue(el)
    # adds an element to the queue
    @queue.push(el)
    # @queue.unshift(el)
  end

  def dequeue
    # removes one element from the queue
    @queue.shift
    # @queue.pop(el)
  end

  def show
    # return a copy of the queue
    @queue.clone
  end
end

class Map
  def initialize
    # create ivar to store for map
    @map = Array.new
  end

  def assign(key, value)
    # create new key in the map and assign value
    @map << [key, value]
  end

  def lookup(key)
    # lookup element by key in nap
    @map.each {|el| return true if el[0] == key}
    false
  end

  def remove(key)
    # removes one element from the map
    index = -1
    @map.each_with_index {|el, i| index = i if el[0] == key}
    if index < 0
      false
    else
      @map.delete_at(index)
    end
  end

  def show
    # return a copy of the map
    @map.clone
  end
end

if __FILE__ == $PROGRAM_NAME
  stack = Stack.new
  stack.add(1)
  stack.add(2)
  p stack.show
  stack.remove
  p stack.show

  queue = Queue.new
  queue.enqueue(1)
  queue.enqueue(2)
  queue.enqueue(3)
  p queue.show
  queue.dequeue
  queue.dequeue
  p queue.show

  map = Map.new
  map.assign(1, "1")
  map.assign(2, "2")
  map.assign(3, "3")
  p map.show
  p map.lookup(1)
  p map.lookup(5)
  map.remove(6)
  map.remove(1)
  p map.show
end
