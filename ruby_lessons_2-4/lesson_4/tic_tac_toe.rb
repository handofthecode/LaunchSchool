require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
PLAYER = ["player_1", "player_2"]

def prompt(words)
  puts "=> " + words
end

def joiner(array, delimiter, conjunction)
  string = ''
  array.each_with_index do |num, index|
    if array.length - 1 == index
      string.strip!
      string += " " + conjunction + " " + num.to_s + "."
      return string
    else
      string += num.to_s + delimiter + " "
    end
  end
end

def display_board(b)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "First to win 5 rounds wins the game."
  puts ""
  puts "     |     |"
  puts "  #{b[1]}  |  #{b[2]}  |  #{b[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{b[4]}  |  #{b[5]}  |  #{b[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{b[7]}  |  #{b[8]}  |  #{b[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joiner(empty_squares(brd), ',', 'or')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "invalid entry"
  end
  brd[square] = PLAYER_MARKER
end

def central_square(brd)
  return 5 if empty_squares(brd).include?(5)
end

def computer_places_piece!(brd)
  aggressive_strategy = winning_square(brd, COMPUTER_MARKER)
  deffensive_strategy = winning_square(brd, PLAYER_MARKER)
  
  square = aggressive_strategy unless square
  square = deffensive_strategy unless square
  square = central_square(brd) unless square
  square = empty_squares(brd).sample unless square

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  if current_player == PLAYER[0]
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def winning_square(brd, computer_or_player_marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(computer_or_player_marker) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      index = brd.values_at(*line).find_index(INITIAL_MARKER)
      return line[index]
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def win_five_rounds?(player_score, computer_score)
  if player_score == 5 || computer_score == 5
    true
  else
    false
  end
end

def announce_winner(player_score)
  if player_score == 5
    prompt "YOU'VE DONE IT! YOU'VE WON!"
  else
    prompt "...you've lost..."
  end
end

def detect_difficulty(input)
  return input if %w(e m h).include?(input)
  puts "Invalid input. Enter 'e', 'm', or 'h'"
end

def starting_player_value(difficulty)
  if difficulty == 'e'
    PLAYER[0]
  elsif difficulty == 'm'
    PLAYER.sample
  elsif difficulty == 'h'
    PLAYER[2]
  end
end

def alternate_player(current_player)
  if current_player == PLAYER[0]
    PLAYER[1]
  else
    PLAYER[0]
  end
end

loop do
  player_score = 0
  computer_score = 0
  prompt "Welcome to Tic-Tac-Toe."
  prompt "Type 'e', 'm', or 'h' for an Easy, Medium, or Hard game."
  difficulty = detect_difficulty(gets.chomp.downcase)

  current_player = starting_player = starting_player_value(difficulty)
  loop do
    board = initialize_board

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      display_board(board)
      winner = detect_winner(board)
      prompt("#{winner} won!")
      prompt "------------"
      sleep(1)

      if winner == "Player"
        player_score += 1
      else
        computer_score += 1
      end

    else
      prompt "It's a tie!"
      prompt "-----------"
    end

    prompt "Your score: #{player_score}  Computer: #{computer_score}"
    current_player = starting_player unless difficulty == 'm'
    if win_five_rounds?(player_score, computer_score)
      announce_winner(player_score)
      break
    end
    prompt "Next game."
    sleep(2)
  end
  prompt "Play AGAIN?"
  break unless gets.chomp.downcase.start_with?('y')
end
prompt "Thank you for Playing Tic-Tac-Toe!"
