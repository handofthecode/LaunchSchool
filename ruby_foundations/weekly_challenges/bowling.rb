class Game
  ALL_PINS = 10
  def initialize()
    @score = []
  end

  def roll(pins)
    raise 'Pins must have a value from 0 to 10' unless (0..10).cover?(pins)
    raise 'Should not be able to roll after game is over' if 
      @score.count == 10 && (@score.last.is_a? Array) && !@score.last.one? &&
      [@score.last].flatten.reduce(:+) != 10
    
    last = @score.last
    if pins == ALL_PINS
      @score << ALL_PINS
    elsif (last.is_a? Array) && last.one?
      @score.last << pins
      raise 'Pin count exceeds pins on the lane' if @score.last.reduce(:+) > 10
    else
      @score << [pins]
    end
  end

  def score
    raise 'Score cannot be taken until the end of the game' if 
      @score.count < 10 || (@score[9] != ALL_PINS && @score[9].one?)
    raise 'Game is not yet over, cannot score!' if 
      @score.count == 10 && [@score.last].flatten.reduce(:+) == 10
      
    points, fill = 0, ([@score[10..11]]).flatten
    
    @score.each_with_index.inject(0) do |total, (pins, idx)|
      return points + fill.reduce(:+) + [pins].flatten.reduce(:+) if 
        idx == 9 && !fill.empty?
        
      points += calculate_roll(pins, @score[idx+1], @score[idx+2], 
                              (@score[idx+1].is_a? Array), 
                              (@score[idx+2].is_a? Array))
    end
  end

  def calculate_roll(pins, id1, id2, id1a, id2a)
    if pins == ALL_PINS && id1a
      id1.reduce(:+) + ALL_PINS
    elsif pins == ALL_PINS
      ALL_PINS * 2 + (id2a ? id2[0] : ALL_PINS)
    elsif pins.reduce(:+) == ALL_PINS
      ALL_PINS + ((id1a) ? id1[0] : ALL_PINS)
    else
      pins.reduce(:+)
    end
  end
end


# class Game
#   ROUNDS = 10

#   attr_reader :rounds

#   def initialize
#     @rounds = []
#   end

#   def roll(score)
#     check_valid_roll(score)

#     rounds.last&.status == :open ? rounds.last.add(score) : rounds << Round.new(score)

#     rounds.slice(0, rounds.length - 1).each do |round|
#       round.add(score) if round.status != :finished
#     end
#   end

#   def score
#     raise unfinished_game_error_message unless game_finished?
#     rounds.slice(0, ROUNDS).reduce(0) { |total, round| total + round.total }
#   end

#   def check_valid_roll(score)
#     raise 'Pins must have a value from 0 to 10' unless (0..10).cover?(score)
#     raise 'Should not be able to roll after game is over' if game_finished?
#   end

#   def game_finished?
#     rounds[ROUNDS - 1]&.status == :finished
#   end

#   def unfinished_game_error_message
#     return 'Game is not yet over, cannot score!' if @rounds[ROUNDS - 1]&.status == :xtra_balls
#     'Score cannot be taken until the end of the game'
#   end
# end

# class Round
#   PIN_TOTAL = 10
#   attr_accessor :status
#   attr_reader :scores

#   def initialize(initial_score)
#     @scores = [initial_score]
#     @status = initial_score == PIN_TOTAL ? :xtra_balls : :open
#   end

#   def add(score)
#     scores.push(score)
#     raise 'Pin count exceeds pins on the lane' if total > 10 && status == :open
#     self.status = :xtra_balls if total == PIN_TOTAL
#     self.status = :finished if round_finished?
#   end

#   def total
#     scores.reduce(:+)
#   end

#   def round_finished?
#     scores.length == 3 || total < PIN_TOTAL && scores.length == 2
#   end
# end
