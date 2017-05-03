class ComputerPlayer
  attr_accessor :guess_hash, :opened

  def initialize
    @guess_hash = Hash.new {|h, k| h[k] = []}
    @opened = Hash.new {|h, k| h[k] = []}
  end

  def record_response(board, fin = false)
    p "AI got it!"
    process_response(board, fin)
  end

  def process_response(board, fin)
    board.each_with_index do |line, y|
      line.each_with_index do |_, x|
        val = board[y][x]
        @guess_hash[val] << [y, x] if val != "." && !@guess_hash[val].include?([y, x]) && !@opened.has_key?(val)
        if fin && @guess_hash[val].length == 2
          @opened[val] =  @guess_hash[val]
          @guess_hash.delete(val)
        end
      end
    end
    p "Guesses"
    p @guess_hash
    p "Opened"
    p @opened
  end

  def prompt(line)
    print "Dear #{@name}, please, #{line}"
    take_turn
  end

  def take_turn
    row, col = [0,1,2,3].sample, [0,1,2,3].sample
    return "#{row}, #{col}"
  end


end
