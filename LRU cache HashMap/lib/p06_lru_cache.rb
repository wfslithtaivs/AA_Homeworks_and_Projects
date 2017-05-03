require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc = Proc.new { |x| x ** 2 })
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    res = nil
    if @map.include?(key)
      res = @map.get(key)
      update_link!(key)
    else
      res = calc!(key)
      eject! if @store.count > @max
    end
    res
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    res = @prc.call(key)
    @map.set(key, res)
    @store.append(key, res)
    res
  end

  def update_link!(key)
    # suggested helper method; move a link to the end of the list
    res = @store.get(key)
    @store.remove(key)
    @store.append(key, res)
  end

  def eject!
    dkey = @store.first.key
    @map.delete(dkey)
    @store.remove(dkey)
  end
end
