require_relative "mancala"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
    
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_index do |i|
      unless i == 6 || i == 13
        cups[i] << :stone until cups[i].length == 4
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
  end

  def make_move(start_pos, current_player_name)
    # start_pos -= 1 if start_pos <= 6
    n_stones = cups[start_pos].length
    cups[start_pos] = []
    
    i = 1
    until n_stones == 0
      idx = (start_pos + i) % 14
      
      if @name1 == current_player_name && idx == 13
        i += 1
        next
      elsif @name2 == current_player_name && idx == 6
        i += 1
        next
      else
        cups[idx] += [:stone]
        i += 1
        n_stones -= 1
      end
    end
    
    render
    next_turn(current_player_name, idx)
  end

  def next_turn(name, ending_cup_idx)
    # helper method to determine what #make_move returns
    if @name1 == name && ending_cup_idx == 6 
      :prompt
    elsif @name2 == name && ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].length == 1
      :switch
    else
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
    prc = Proc.new { |cup| cup.empty? }
    side1 = cups[0..5]
    side2 = cups[7..12]
    
    return true if side1.all?(&prc) || side2.all?(&prc)
    false
  end

  def winner
    case cups[6].length <=> cups[13].length
    when 0
      return :draw
    when 1
      return @name1
    when -1
      return @name2
    end
  end
end
