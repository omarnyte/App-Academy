require_relative "board.rb"
require_relative "cursor.rb"
require "colorize"
require "byebug"

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |space, j|
        print " |#{@board[[i, j]]}| "
      end
      puts 
    end

  end

end

if $0 == __FILE__
  Display.new(Board.new).render
end
