require_relative 'p02_hashing'

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return if include?(key)
    self[key] << key
    @count += 1
    resize! if @count == num_buckets
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    @count -= 1  if self[key].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    temp_store = HashSet.new(num_buckets * 2)
    @store.each {|bucket| bucket.each {|el| temp_store.insert(el)} }
    @store = temp_store.store
  end
end
