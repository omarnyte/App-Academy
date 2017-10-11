require 'colorize'


module Slideable
  def moves

  end

  def move_dirs

  end

  def horizontal_dirs(pos)
    piece_row = pos.first

    @coord_grid.each_with_index do |row, ind|
      return row if piece_row == ind
    end
  end


  def vertical_dirs(pos)
    piece_col = pos.last

    transposed_grid = @coord_grid.dup.transpose

    transposed_grid.each_with_index do |col, ind|
      return col if piece_col == ind
    end
  end

  def diagonal_dirs

  end

  def grow_unblocked_moves_in_dir(dx, dy)

  end
end


class Piece
  attr_reader :symbol

  def initialize(color = nil, symbol = nil, current_pos = [0, 0])
    @symbol = symbol
    @color = color
    @current_pos = current_pos    #TODO figure out how this is going to be tracked/updated
    @coord_grid = Array.new(8) {Array.new(8)}

    @coord_grid.each_with_index do |row, ind|
      row.each_index do |square|
        @coord_grid[ind][square] = [ind, square]
      end
    end

  end

  def to_s
    if @color == :black
       @symbol.colorize(:blue)
    elsif @color == :white
      @symbol.colorize(:magenta)
    else
      @symbol.colorize(:brown)
    end
  end
end

class Rook < Piece
  include Slideable

  def moves(pos)
    array_of_moves = []

    array_of_moves = horizontal_dirs(pos) + vertical_dirs(pos)
  end

end

class NullPiece < Piece
  def moves

  end

end
