class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times do
        cup << :stone
      end
    end


  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 13)
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    current_cup_idx = start_pos
    until stones.empty?
      current_cup_idx += 1
      #loops around at the end of the board
      current_cup_idx = 0 if current_cup_idx > 13

      if current_cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif current_cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[current_cup_idx] << stones.pop
      end
    end

    render

    next_turn(current_cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      #if it ens on store
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      #if it ends on empty cup that isn't a store
      :switch
    else
      #if it ends on a cup with stones in it
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
      return true
    else
      return false
    end
  end

  def winner
    case @cups[6].count <=> @cups[13].count
    when 0
      :draw
    when -1
      @name2
    when 1
      @name1
    end
  end
end
