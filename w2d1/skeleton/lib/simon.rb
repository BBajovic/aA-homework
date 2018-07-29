class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn
    until game_over
      take_turn
    end
    if game_over
      game_over_message
      reset_game
    end
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    unless game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 1
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Enter the first letter of each color in sequence"
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message

  end

  def game_over_message
    puts "Game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
