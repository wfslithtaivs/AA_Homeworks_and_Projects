class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1 if !@game_over
  end

  def show_sequence
    add_random_color
  end

  def require_sequence

  end

  def add_random_color(options = [])
    to_add = options.empty? ? COLORS.sample : options
    @seq << to_add
  end

  def round_success_message
    p "Round #{@sequence_length} is finished."
  end

  def game_over_message

  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
