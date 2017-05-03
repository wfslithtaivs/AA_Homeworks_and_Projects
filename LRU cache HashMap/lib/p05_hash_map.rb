require_relative 'p02_hashing'
require_relative 'p04_linked_list'
require 'byebug'

class HashMap
  attr_reader :count, :store

  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    return true if bucket(key).include?(key)
    false
  end

  def set(key, val)
    if bucket(key).include?(key)
      bucket(key).update(key, val)
    else
      bucket(key).append(key, val)
      @count += 1
    end

    resize! if @count == num_buckets
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if bucket(key).include?(key)
      bucket(key).remove(key)
      @count -= 1
    end
  end

  def each
    @store.each { |bucket| bucket.each {|el| yield el.key, el.val} }
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    temp_hash = HashMap.new(2 * num_buckets)
    each { |k, v| temp_hash.set(k, v) }
    @store = temp_hash.store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end
end
