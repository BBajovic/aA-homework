require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times do
        cups[idx] << :stone
      end
    end

  end

  def valid_move?(start_pos)
    unless start_pos.between?(0, 5) || start_pos.between?(7, 12)
      raise "Invalid starting cup"
    end

    if cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []

    index = start_pos
    until stones.empty?
      index += 1
      if index > 13
        index = 0
      end

      if index ==  6
        cups[index] << stones.pop if current_player_name == @name1
      elsif index == 13
        cups[index] << stones.pop if current_player_name == @name2
      else
        cups[index] << stones.pop
      end
    end


    render
    next_turn(index)
  end

  def next_turn(ending_cup_idx)
    # byebug
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].size == 1
      return :switch
    else
      return ending_cup_idx
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
    cups[0..6].all?{|cup| cup.empty?} || cups[7..12].all?{|cup| cup.empty?}
  end

  def winner
    case @cups[6] <=> @cups[13]
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end
