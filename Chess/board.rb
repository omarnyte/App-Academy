require_relative "piece.rb"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}

  end

  def populate
    @grid.each_with_index do |row, i|
      row.each_with_index do |space, j|
        if i.between?(0, 1) || i.between?(6, 7)
          @grid[i][j] = Piece.new
        else
          @grid[i][j] = NullPiece.new
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece_type)
    row, col = pos
    @grid[row][col] = piece_type
  end

  def move_piece(start_pos, end_pos)
    raise "There's no piece at #{start_pos}" if self[start_pos].is_a?(NullPiece)
    #TODO Update error code to account for colors of pieces
    raise "There's already a piece at #{end_pos}" if self[end_pos].is_a?(Piece)
  end
end
