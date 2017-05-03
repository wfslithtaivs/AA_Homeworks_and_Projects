require_relative "card.rb"
require_relative "board.rb"
require_relative "player.rb"
require_relative "ai.rb"

class MemoryGame
  attr_accessor :board, :guessed_pos, :previous_guess, :player_type

  def initialize(player, player_type)
    @board = Board.new
    @board.populate(randomize)
    @player = player
    @player_type = player_type
  end

  def randomize
    deck = []
    symbols = ("A".."Z").to_a
    (@board.size**2 / 2).times do |_|
      s = symbols.sample
      deck << Card.new(s)
      deck << Card.new(s)
      symbols.delete(s)
    end

    deck.shuffle
  end

  def play

    display

    while !won?
      previous_guess = take_turn
      if previous_guess == "Stop"
        display
        break
      end
      @board.reveal(previous_guess)
      display

      @player.record_response(@board.board_to_a) if @player_type == :ai

      guessed_pos = take_turn
      if guessed_pos == "Stop"
        display
        break
      end
      @board.reveal(guessed_pos)
      display

      @player.record_response(@board.board_to_a) if @player_type == :ai

      if @board[previous_guess].to_s != @board[guessed_pos].to_s || previous_guess == guessed_pos
         @board[previous_guess].hide if !@board[previous_guess].final
         @board[guessed_pos].hide if !@board[guessed_pos].final
        print "Sorry, no matches \n"
      else
        @board[previous_guess].set_final
        @board[guessed_pos].set_final
      end

      @player.record_response(@board.board_to_a) if @player_type == :ai

      display
    end

    p "You won!"
  end

  def take_turn
    input = @player.prompt("Enter the position to open (ex. 1,2): \n")

    return if input.length == 1

    if input == "Boring"
      @board.open
      return "Stop"
    end

    input = input.split(",").map {|el| el.to_i}
    p "Your input is #{input}"

    if check_legal_input(input)
      return input
    else
      print "Sorry, input is illegal, please, try again. \n"
      take_turn
    end

  end

  def check_legal_input(array)
    array.all? {|el| el.class == Fixnum && (el >= 0 && el < @board.size)}
  end

  def won?
    @board.won?
  end

  def display
    @board.render
  end

end

if __FILE__ == $PROGRAM_NAME
  print "Computer or Human: enter 0 or 1: \n"
  input = gets.chomp.to_i
  g = input == 0 ? MemoryGame.new(ComputerPlayer.new, :ai): MemoryGame.new(Player.new, :human)
  g.play
end
