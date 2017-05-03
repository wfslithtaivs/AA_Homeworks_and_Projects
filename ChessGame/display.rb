require_relative 'board'
require_relative 'cursorable'
require 'colorize'
require_relative 'cursor.rb'
require 'byebug'

class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    # while not Ctrl + C do render board
    while true

      space = @board.board
      selected = @cursor.selected_pos

      if selected.length == 2

        @board.move_piece(:red, selected[0], selected[1])
        @cursor.selection_clear
      end

      space.each_with_index do |row, idx|
        row.each_with_index do |el, i|

          el_to_print = space[idx][i]

          if @cursor.cursor_pos == [idx, i]
            print "#{el_to_print.to_s} ".colorize(:color => :black, :background => :light_yellow )
          elsif selected.include?([idx, i])
             print "#{el_to_print.to_s} ".colorize(:green)
          else
            print "#{el_to_print.to_s} ".colorize(el_to_print.color)
          end

        end
        print "\n"
      end
      @cursor.get_input
      system("clear")
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  d.render
end
