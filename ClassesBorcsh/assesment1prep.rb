require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
    arr = accumulator ? self.dup : self.drop(1).dup
    accumulator ||= self.first
    if block_given?
      arr.each {|el| accumulator = yield accumulator, el}
    else
      arr.each {|el| accumulator += el}
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (num-1).downto(2) {|i| return false if num % i == 0}
  true
end

def primes(num)
  res = []
  i = 2
  until res.length == num
    res << i if is_prime?(i)
    i += 1
  end
  res
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  prev = factorials_rec(num-1)
  prev << (num-1) * prev.last
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dups = Hash.new {|h, k| h[k] = []}
    self.each_with_index {|el, idx| dups[el] << idx}
    dups.select {|k, v| v.length > 1}
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    substrings = []
    i = 0
    letters = self.chars
    while i < letters.length
      j = i + 1
      while j <= letters.length
        substrings << self.slice(i, j)
        j += 1
      end
      i += 1
    end
    substrings.uniq.select {|el| el == el.reverse && el.length > 1}
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new {|el1, el2| el1 <=> el2}

    return [] if self.empty?
    return self if self.length < 2
    half = self.length / 2

    right_side = self.take(half).merge_sort(&prc)
    left_side = self.drop(half).merge_sort(&prc)


    self.class.merge(left_side, right_side, &prc)
  end

  private

  def self.merge(left, right, &prc)
    prc ||= Proc.new {|el1, el2| el1 <=> el2}
    res = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
        when -1
          res << [left.shift]
        when 1
          res << [right.shift]
      end
    end
    res.concat(left)
    res.concat(right)
    res.flatten

  end

end
