a = Time.now

def make_better_change(target, coins)
  return if target <= 0
  coin = coins.sample
  leftover = target - coin
  validcoins = coins.select{|s| s <= leftover}
  [coin, make_better_change(leftover, validcoins)].flatten
end

def mcloop(target, coins, n)
  optimal = make_better_change(target, coins)
  n.times do
    candidate = make_better_change(target,coins)
    optimal = candidate if candidate.length < optimal.length
  end
  optimal[0..-2]
end

1.times do
  p mcloop(24, [10, 7, 1], 10).sort
end

p "#{Time.now - a} for Random guess"

a = Time.now
p "------Make Change-------"
def greedy_make_change(amount, coins = [25, 10, 5, 1])
  coins.sort.reverse.map do |coin|
    f = amount/coin
    amount %= coin
    Array.new(f){coin}
  end.flatten
end

p greedy_make_change(24, [10, 7, 1]).sort
p "#{Time.now - a} for Greedy ant"

a = Time.now
def even_better_change(target, coins = [25, 10, 5, 1])
  searching_array = coins.dup
  found = false
  while !found
    searching_array = searching_array.product(coins)
    searching_array = searching_array.select do |arr|
      return arr if arr.flatten.reduce(:+) == target
      arr.flatten.reduce(:+) < target
    end
  end
end

p even_better_change(24, [10, 7, 1]).flatten.sort
p "#{Time.now - a} for Even better change"


a = Time.now

def see_the_difference_change(target, coins = [10, 7, 1])

end

p see_the_difference_change(24, [10, 7, 1])
p "#{Time.now - a} for See the difference change"
