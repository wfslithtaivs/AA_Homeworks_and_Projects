class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_num = length.hash
    if empty?
      hash_num += length.hash
    end
    self.each_with_index { |el, i| hash_num ^= (el.hash + i.hash) }
    hash_num
  end
end

class String
  def hash
    hash_num = length.hash
    if empty?
      hash_num += length.hash
    end
    self.chars.each_with_index { |el, i| hash_num ^= (el.ord.hash + i.hash) }
    hash_num
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_num = length.hash
    self.each { |k, v| hash_num ^= (k.hash + v.hash) }
    hash_num
  end
end
