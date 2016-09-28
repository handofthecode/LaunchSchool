VALID_CHOICES = %w(rock paper scissors lizard spock)
@computer_score = 0
@player_score = 0

def convert_answer(input)
  VALID_CHOICES.find {|word| word.match(input)}
end

def win?(first, second)
  (first == "rock") && (second == "scissors" || second == "lizard") ||
    (first == "paper") && (second == "rock" || second == "spock") ||
    (first == "scissors") && (second == "paper" || second == "lizard") ||
    (first == "lizard") && (second == "paper" || second == "spock") ||
    (first == "spock") && (second == "rock" || second == "scissors")
end

def score(result)
  if result == "YOU WIN!"
    @player_score += 1
  elsif
    result == "YOU LOSE!"
    @computer_score += 1
  end
end

def determine_result(player, computer)
  if win?(player, computer)
    "YOU WIN!"
  elsif win?(computer, player)
    "YOU LOSE!"
  else
    "IT'S A TIE!"
  end
end

def prompt(message)
  puts "=> #{message}"
end

loop do
  prompt("Welcome to #{VALID_CHOICES.join(', ').upcase}")
  prompt("-----------------------------------------------")
  prompt("First to 5 points WINS THE WAR!!!")

  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    input = ''
    loop do
      input = gets.chomp
      if VALID_CHOICES.any? { |word| word.match(input) }
        break
      else
        prompt "Must type either #{VALID_CHOICES.join(', or ')}"
      end
    end
    choice = convert_answer(input)
    computer_choice = VALID_CHOICES.sample
  
    puts "You chose #{choice}. Computer chose #{computer_choice}."
    result = determine_result(choice, computer_choice)
    
    score(result)
    prompt(result)
    prompt("Your Score: " + @player_score.to_s + "  Computer Score: " + @computer_score.to_s)
    prompt("----------------------------------")
    if @player_score == 5
      prompt("YOU'VE WON THE WAR!!!")
      prompt("----------------------")
    elsif @computer_score == 5
      prompt("YOU SULK AWAY IN DISCRACE!!!")
      prompt("------------------------------")
      break
    end
  end  
  @computer_score = 0
  @player_score = 0
  prompt "Do you want to play again?"
  break unless gets.chomp.downcase.start_with?('y')
end
  prompt("Okay! BYYYyyyeeeee!")
