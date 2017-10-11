require_relative "piece.rb"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}

  end

  def populate
    @grid.each_with_index do |row, i|
      row.each_with_index do |space, j|
        if i.between?(0, 1)
          @grid[i][j] = Piece.new(:white, "♔")
        elsif i.between?(7, 8)
          @grid[i][j] = Piece.new(:black, "♔")
        else
          @grid[i][j] = NullPiece.new(:white, "🤡")
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
    raise "Your piece is already at #{end_pos}" if self[end_pos].color == @current_player  #TODO @current player doesn't exist yet
  end

  def in_bounds?(pos)
    return false unless pos.first.between?(0, 7)
    return false unless pos.last.between?(0, 7)
    true
  end

  # def valid_move?(start_pos, end_pos)
  #   if !in_bounds?(end_pos)
  #     return false
  #   elsif
  #     self[start_pos].moves.select {|moves| #in between start_pos and next piece in path (exclusive) || end_pos }
  #   elsif
  #
  #   end
  #
  #
  # end
end
