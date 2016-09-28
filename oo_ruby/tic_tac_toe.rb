class Board
  attr_reader :human, :computer
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 5, 9], [7, 5, 3],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9]].freeze

  def draw
    puts ""
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
  end

  def initialize(human, computer)
    @human = human
    @computer = computer
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def reset
    initialize(@human, @computer)
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def [](key)
    @squares[key].marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner(human.marker) || !!detect_winner(computer.marker)
  end

  def count_markers(squares, player)
    squares.collect(&:marker).count(player)
  end

  def detect_winner(player)
    WINNING_LINES.each do |line|
      return player if count_markers(@squares.values_at(*line), player) == 3
    end
    nil
  end

  def index_of_marker(squares, marker)
    squares.each_with_index { |obj, idx| return idx if obj.marker == marker }
  end

  def winning_square(player)
    WINNING_LINES.each do |line|
      if count_markers(@squares.values_at(*line), player) == 2 &&
         count_markers(@squares.values_at(*line), Square::INITIAL_MARKER) == 1
        idx = index_of_marker(@squares.values_at(*line), Square::INITIAL_MARKER)
        return line[idx]
      end
    end
    nil
  end
end

class Square
  INITIAL_MARKER = " ".freeze
  attr_accessor :marker

  def initialize(marker= INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :score, :marker, :name
  def initialize(marker = "X")
    @score = 0
    @marker = marker
  end

  def add_point
    self.score += 1
  end

  def reset_score
    self.score = 0
  end
end

class TTTGame
  COMPUTER_NAMES = { 'T' => 'TARZAN', 'J' => 'THE JACKLE', 'F' => 'MR. FISH',
                     'S' => 'PROFESSOR SCIENCE', 'B' => 'THE BUTTRESS',
                     'M' => 'AN OLD MUFFIN', 'P' => 'PUMPKIN FACE',
                     'W' => 'THE WICKED WITCH OF THE WEST' }.freeze
  VERBS = ['saunters', 'flys', 'hobbles', 'crawls', 'bounces', 'somersaults',
           'rolls awkwardly', 'runs screaming', 'pilots a spacecraft'].freeze
  CURSES = ['Curse it all', 'Thunderbutt', 'Oh Hick- Hickory', 'Shhhhaaazle',
            'Moxy and feathers', 'Confound it to heck', 'By Jove!', 'You cheat',
            'Whyyy I autta', 'Try that just one more time! I dare you', 'NOOOO',
            'You\'ve played your last round', 'You\'re mother was a bandit',
            'You stink', 'Your father smells of elderberries'].freeze
  attr_reader :board
  attr_accessor :current_marker, :human, :first_to_move, :computer

  def initialize
    @first_to_move = ''
    @human = Player.new
    @computer = Player.new
    @current_player = @human
    @board = Board.new(@human, @computer)
  end

  def set_computer_name_and_marker
    random_index = (0...COMPUTER_NAMES.count).to_a.sample
    computer.marker = COMPUTER_NAMES.keys[random_index]
    computer.name = COMPUTER_NAMES.values[random_index]
  end

  def set_human_name
    puts "\"What is your name by the way?\""
    loop do
      human.name = gets.chomp
      break if !human.name.delete(' ').empty?
      puts "Your name must have atleast one character."
    end
  end

  def set_first_player
    puts "\"And who, #{human.name}, \
would you like to go first each round: Me or You?\" (m/y)"
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if ['m', 'y'].include?(answer)
      puts "You must enter either 'm' or 'y'."
    end
    @first_to_move = if answer == 'm'
                       :player
                     else
                       :opponent
                     end
  end

  def set_first_move
    @current_player = if @first_to_move == :player
                        @human
                      else
                        @computer
                      end
  end

  def set_human_marker
    puts "\"What would you like your marker to be #{human.name}?\" \
(enter any character)"
    loop do
      human.marker = gets.chomp
      if human.marker.size != 1 && human.marker.delete(' ').empty?
        puts "Marker must be one character long."
      elsif human.marker == computer.marker
        puts "#{computer.name} already chose a(n) \"#{human.marker}\"."
      else
        break
      end
      puts "Choose a new marker"
    end
  end

  def reset_game
    reset_score
    reset_round
  end

  def reset_score
    human.reset_score
    computer.reset_score
  end

  def reset_round
    board.reset
    set_first_move
  end

  def clear
    system 'clear'
  end

  def display_welcome_message
    puts "#{computer.name} #{VERBS.sample} over to you and says..."
    sleep(1)
    puts "\"It's time to play tic-tac-toe!\""
    sleep(1)
  end

  def display_goodbye_message
    puts "\"AAAND STAY OUT!!\" Shouts #{computer.name}."
  end

  def display_board
    clear
    puts "#{human.name} is a #{human.marker}. \
#{computer.name} is a #{computer.marker}."
    display_score
    board.draw
  end

  def display_score
    if human.score > 4
      puts "YOU WON THE GAME!!!"
    elsif computer.score > 4
      puts "YOU WERE DEFEATED!"
    else
      puts "You're score: #{human.score}. \
#{computer.name}'s score: #{computer.score}."
    end
  end

  def display_open_squares
    array = board.unmarked_keys
    array[-1] = "or #{array[-1]}" if array.size > 1
    puts "Choose a square: #{array.join(', ')}."
  end

  def human_moves
    display_open_squares
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Invalid entry. Please try again."
    end
    board[square] = human.marker
  end

  def computer_moves
    if board.winning_square(computer.marker)
      board[board.winning_square(computer.marker)] = computer.marker
    elsif board.winning_square(human.marker)
      board[board.winning_square(human.marker)] = computer.marker
    elsif board[5] == Square::INITIAL_MARKER
      board[5] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def display_result
    display_board
    if board.detect_winner(human.marker)
      human.add_point
      puts "#{human.name} WINS!"
      sleep(1)
      puts "\"#{CURSES.sample}!!\" Exclaims #{computer.name}."
      sleep(1)
    elsif board.detect_winner(computer.marker)
      puts "#{computer.name} WINS!"
      computer.add_point
    else
      puts "It's a tie!"
    end
    sleep(1)
  end

  def announce_next_round
    puts "Next round!"
    sleep(1)
  end

  def play_again?
    puts "Would you like to play another 5 rounds? ('y'/'n')"
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Invalid entry. Must answer 'y' or 'n'"
    end
    answer == 'y'
  end

  def alternate_player
    @current_player = if human_turn?
                        @computer
                      else
                        @human
                      end
  end

  def current_player_moves
    human_turn? ? human_moves : computer_moves
  end

  def human_turn?
    @current_player == @human
  end

  def win_five_rounds?
    human.score > 4 || computer.score > 4
  end

  def setup
    set_computer_name_and_marker
    clear
    display_welcome_message
    set_human_name
    set_human_marker
    set_first_player
  end

  def round_loop
    set_first_move
    display_board
    loop do
      current_player_moves
      display_board if !human_turn?
      break if board.someone_won? || board.full?
      alternate_player
    end
  end

  def game_loop
    loop do
      round_loop
      display_result
      break if win_five_rounds?
      announce_next_round
      reset_round
    end
  end

  def play
    setup
    loop do
      game_loop
      display_board
      break unless play_again?
      reset_game
    end
    display_goodbye_message
  end
end

TTTGame.new.play
