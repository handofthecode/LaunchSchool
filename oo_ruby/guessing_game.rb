class GuessingGame
  def initialize(low, high)
    @range = (low..high)
    @answer = @range.to_a.sample
    @guesses_left = Math.log2(high-low).to_i - 1
  end

  def input_number
    loop do
      num = gets.chomp.gsub(/\D[^-]/, 'B')
      return num.to_i unless num.include?('B')
      puts "To proceed, you must enter a valid number."
    end
  end

  def game_loop
    @guesses_left.downto(0) do |guesses_left|
      guess = guess_number
      return :win if guess == @answer
      give_hint(guess)
      puts "You have #{guesses_left} guesses left."
    end
    :lose
  end

  def display_outcome(game)
    puts game == :win ? "You Win!" : "You lose!"
  end

  def guess_number
    loop do
      puts "Guess a number between #{@range.first} and #{@range.last}:"
      guess = gets.chomp.gsub(/\D[^-]/, 'B')
      if guess.include?('B')
        puts "Guess contains invalid characters."
        next
      else
        return guess.to_i if @range.cover?(guess.to_i)
        puts "Guess is out of range. Try again."
      end
    end
  end

  def give_hint(guess)
    puts "Your guess is too high!" if guess > @answer
    puts "Your guess is too low!" if guess < @answer
  end

  def play
    display_outcome(game_loop)
  end
end

game = GuessingGame.new(5, 100)
game.play