class EmptyCup < ArgumentError
  def message
    "That cup is empty! Pick a cup that has stones in it!"
  end
end

class OffTheBoard < ArgumentError
  def message
    "That is an invalid starting up! Make sure you select a position on the board!"
  end
end

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

# helper method to #initialize every non-store cup with four stones each
  def place_stones
    @cups.each_with_index do |cup, idx|
      #cup += [:stone, :stone, :stone, :stone] unless idx == 6 || idx == 13
      next if idx == 6 || idx == 13
      4.times { cup << :stone}
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    in_cup = start_pos

    until stones.empty?
      in_cup += 1
      in_cup = 0 if in_cup > 13

      if in_cup == 6
          @cups[in_cup] << stones.shift if current_player_name == @name1
      elsif in_cup == 13
          @cups[in_cup] << stones.shift if current_player_name == @name2
      else
          @cups[in_cup] << stones.shift
      end
    end
    render
    next_turn(in_cup)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if [0, 1, 2, 3, 4, 5].all? {|idx| @cups[idx].empty?}
    return true if [7, 8, 9 ,10, 11, 12].all? {|idx| @cups[idx].empty?}
    false
  end

  def winner
    if @cups[6].count == @cups[13].count
      :draw
    else
      @cups[6].count > @cups[13].count ? @name1 : @name2
    end
  end
end
