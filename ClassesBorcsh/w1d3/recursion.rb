# range
def range(first, last)
  return [first] if first == last
  range(first, last - 1) + [last]
end

# exponential
def exp(b, n)
  n == 0 ? 1 : exp(b, n-1) * b
end

p exp(2, 2)
p exp(2, 8)
p exp(3, 3)
p exp(10, 3)

def exp2(b, n)
  return 0 if n == 0
  return b if n == 1
  if n.even?
    holder = exp2(b, n / 2)
    holder * holder
  else
    holder = exp2(b, (n-1)/2)
    b * holder * holder
  end
end

p exp2(2, 2)
p exp2(2, 8)
p exp2(3, 3)
p exp2(10, 3)

# deep dup

def deepdup(arr)
  arr.map{|el| el.is_a?(Array) ? deepdup(el) : el}
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = deepdup(robot_parts)

# shouldn't modify robot_parts
robot_parts_copy[1] << "LEDs"
# but it does
p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

#recursive
def fib(n)
  return if n < 1
  return [1] if n == 1
  return [1,1] if n == 2
  lastfib = fib(n - 1)
  lastfib << lastfib.last(2).reduce(:+)
end

p fib(2)
p fib(3)
p fib(4)
p fib(15)
#iterative fib
def fib_iterative(n)
  result = [1,1]
  return [] if n < 1
  return result[0..0] if n == 1
  return result if n == 2
  (n-2).downto(1) do
    result << result.last(2).reduce(:+)
  end
  result
end

p fib_iterative(2)
p fib_iterative(3)
p fib_iterative(4)
p fib_iterative(15)

#array subsets
def subsets(array)
  return [[]] if array.empty?
  return [[], array] if array.length == 1
  s = subsets(array[0..-2])
  s + s.map{|arr| arr + [array.last]}
end

p subsets([]) == [[]]
p subsets([1]) == [[], [1]]
p subsets([1, 2]) == [[], [1], [2], [1, 2]]
p subsets([1, 2, 3]) ==  [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# permutations
def permutations(array)
  return [array] if array.length == 1
  return [array, array.reverse] if array.length == 2
  array.map do |el|
    perm = permutations(array - [el])
    [([el] + perm[0]).flatten] + [([el] + perm[1]).flatten]
  end.flatten 1
end

p permutations([1, 2, 3]) == [1,2,3].permutation.to_a

# b search
def bsearch(array, target)
  return nil if array.empty? || array.first > target || array.last < target

  half = array.length / 2

  first_half = array[0...half]
  second_half = array[half + 1..-1]

  if array[half] == target
    half
  elsif array[half] > target
    bsearch(first_half, target)
  else
    bs = bsearch(second_half, target)
    bs.nil? ? nil : half + bs + 1
  end
end

p "-------B-Search-------------"
p bsearch([1, 2, 3], 1) # == 0
p bsearch([2, 3, 4, 5], 3) # == 1
p bsearch([2, 4, 6, 8, 10], 6) # == 2
p bsearch([1, 3, 4, 5, 9], 5) # == 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # == 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # == nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # == nil
p bsearch([1, 3, 5, 7, 9, 12], 11) # == nil

# Merge sort

def merge(arr1, arr2)
  res = []
  until arr1.empty? && arr2.empty?
    if arr1.empty?
      res += arr2
      arr2 = []
    elsif arr2.empty?
      res += arr1
      arr1 = []
    elsif arr1.first >= arr2.first
      res << arr2.shift
    else
      res << arr1.shift
    end
  end
  res
end

p "------Merge sorted arrays------"
p merge([1, 2, 5], [3, 4, 6])

def mergesort(array)
  return array if array.length < 2
  half = array.length / 2
  first_half = mergesort(array[0...half])
  second_half = mergesort(array[half..-1])
  merge(first_half, second_half)
end

p "------Sort array------"
p mergesort([1, 2, 5, 3, 4, 6].reverse.shuffle)

p "------Make Change-------"
def greedy_make_change(amount, coins = [25, 10, 5, 1])
  coins.sort.reverse.map do |coin|
    f = amount/coin
    amount %= coin
    Array.new(f){coin}
  end.flatten
end

p greedy_make_change(24, [10, 7, 1])
