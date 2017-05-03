def dups(arr)
  return arr if arr.length < 2
  result = []

  arr.each { |ele| result << ele unless result.include?(ele) }
  result
end


def two_sum(arr)
  return [] if arr.length < 2
  res = []
  arr.each_with_index do |el, idx|
    i = idx + 1
    while i < arr.length
      res << [idx, i] if arr[idx] + arr[i] == 0
      i += 1
    end
  end
  res
end

def my_transpose(arr)
  return arr if arr.length < 2
  raise "Not a square" unless arr.all? {|el| el.length == arr.length}
  res = Array.new(arr.length) {[]}

  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      res[i] << arr[j][i]
    end
  end
  res
end

def stock_picker(arr)
  return nil if arr.length < 2
#initial set
  curr_min_idx = 0
  curr_min = arr[0]
  curr_max_profit = 0
  max_profit_idx = [0, 1]

  arr.each_with_index do |val, i|
    next if i == 0
    if curr_min > arr[i]
      curr_min = arr[i]
      curr_min_idx = i
    else
      potential_max_profit = arr[i] - curr_min
      if potential_max_profit > curr_max_profit
        max_profit_idx = [curr_min_idx, i]
        curr_max_profit = potential_max_profit
      end
    end
  end

  return max_profit_idx unless curr_max_profit <= 0
  nil
end

class User
  def get_input
    puts "Please, enter 0,1 and nothing else for now"
    gets
  end
end

class Towers
  attr_accessor :towers
  def initialize
    @towers = Array.new(3){[]}
    @towers[0] = [3, 2, 1]
    @user = User.new
  end

  def move(from, to)
    @towers[to] << @towers[from].pop if valid_move?(from, to)
  end

  def play
    until won?
        from, to = @user.get_input.chomp.split(",").map(&:to_i)
        move(from, to)
        print_towers
    end
    puts "You are won!"
    [from, to]
  end

  def print_towers
    @towers.each do |tower|
      puts "#{tower.empty? ? '___' : tower}"
    end
  end

  def valid_move?(from, to)
    #debugger
    res = false
    if !@towers[from].empty?
      return true if @towers[to].empty?
      res = @towers[from][-1] < @towers[to][-1]
    end
    res
  end

  def won?
    @towers[1..2].any? {|el| el == [3, 2, 1]}
  end
end

if __FILE__ == $0
  game = Towers.new
  #game.move
end
