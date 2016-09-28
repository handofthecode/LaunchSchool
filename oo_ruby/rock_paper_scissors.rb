class Move
  MOVES = ['rock', 'paper', 'scissors'].freeze

  def initialize(move)
    @move = move
  end

  def rock?
    @move == 'rock'
  end

  def paper?
    @move == 'paper'
  end

  def scissors?
    @move == 'scissors'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def to_s
    @move
  end
end

class Player
  attr_accessor :move, :name
  def initialize
    @name = set_name
  end
end

class Human < Player
  def set_name
    puts "Please enter your name."
    input = ''
    loop do
      input = gets.chomp
      return input unless input.empty?
      puts "You must enter one or more characters."
    end
  end

  def choose
    choice = nil
    loop do
      puts "Please choose Rock, paper, or scissors."
      choice = gets.chomp
      break if Move::MOVES.include?(choice)
      puts "INVALID CHOICE"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    ['C3PO', 'HAL', 'Terminator', 'Digital Meyhem'].sample
  end

  def choose
    self.move = Move.new(Move::MOVES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock Paper Scissors"
  end

  def display_goodbye_message
    puts "Thanks for playing #{human.name}! Goodbye."
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} wins!"
    elsif computer.move > human.move
      puts "#{computer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def playagain?
    puts "do you want to play again? (y/n)"
    answer = nil
    loop do
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts 'Sorry, invalid entry.'
    end
    return true if answer == 'y'
    false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless playagain?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
