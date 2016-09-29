module Hand
  def calculate_total(hand = nil)
    hand = cards if hand.nil?
    total = 0
    hand.each do |card|
      total += if card[0] == 'J' || card[0] == 'Q' || card[0] == 'K'
                 10
               elsif card[0] == 'A'
                 11
               else
                 card[0].to_i
               end
    end

    hand.select { |card| card[0] == 'A' }.each do
      total -= 10 if total > 21
    end
    total
  end

  def bust?
    calculate_total > 21
  end
end

class Dealer
  include Hand
  COMPUTER_NAMES = ['TARZAN', 'THE JACKLE', 'MR. FISH', 'DONALD TRUMP',
                    'PROFESSOR SCIENCE', 'A SMOLDERING CIGAR', 'A BLUE WHALE',
                    'AN OLD MUFFIN', 'PUMPKIN FACE', 'A SMALL LINT BALL',
                    'THE WICKED WITCH OF THE WEST',  'A BLACK HOLE'].freeze

  attr_accessor :cards, :visible_cards, :visible_total, :name
  def initialize
    @cards = []
    @visible_cards = []
    @visible_total = 0
    @name = COMPUTER_NAMES.sample
  end

  def display_one_card
    @visible_cards = [cards[0]] + [["?", "?"]]
  end

  def display_partial_total
    @visible_total = calculate_total([cards[0]])
  end

  def show_all_cards_and_total
    @visible_cards = cards
    @visible_total = calculate_total
  end
end

class Player
  include Hand
  attr_accessor :cards, :name

  def initialize
    @cards = []
    @name = ''
  end

  def set_name
    puts "What is your name?"
    answer = ''
    loop do
      answer = gets.chomp
      break if !answer.delete(' ').empty?
      puts "You must enter atleast one character for your name."
    end
    self.name = answer
  end
end

class Deck
  DECK = ((1..10).to_a + %w(J Q K A)).product(%w(S C H D))
  attr_accessor :cards

  def initialize
    @cards = DECK.dup
  end

  def deal_card
    cards.delete(cards.sample)
  end
end

class Game
  attr_accessor :human, :computer, :deck
  def initialize
    @deck = Deck.new
    @human = Player.new
    @computer = Dealer.new
  end

  def deal
    2.times do
      human_hit
      computer_hit
    end
  end

  def human_hit
    human.cards << deck.deal_card
    display_hands
    puts "#{computer.name} deals you a card..."
    sleep(1)
  end

  def computer_hit
    computer.cards << deck.deal_card
    display_hands
    puts "#{computer.name} takes a card..."
    sleep(1)
  end

  def hit_or_stay
    puts "Would you like to (h)it or (s)tay?"
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      puts "You must enter either a 'h' or an 's'"
    end
    answer
  end

  def player_turn
    loop do
      case hit_or_stay
      when 's'
        puts "You decide to play it safe."
        sleep(1)
        break
      else
        human_hit
      end
      next unless human.bust?
      puts "You Busted!"
      sleep(1)
      break
    end
  end

  def computer_turn
    loop do
      computer.show_all_cards_and_total
      display_hands
      if computer.bust?
        puts "#{computer.name} busts!"
        break
      elsif computer.calculate_total > 17
        puts "#{computer.name} stays..."
        sleep(1)
        break
      else
        computer_hit
      end
    end
  end

  def compare_hands
    if human.bust?
      return "You Lose!"
    elsif computer.bust?
      return "You WIN!"
    else
      case human.calculate_total <=> computer.calculate_total
      when 1
        "You WIN!"
      when 0
        "It's a Draw!"
      when -1
        "You Lose!"
      end
    end
  end

  def print_result
    puts compare_hands
  end

  def display_hands
    system 'clear'
    puts
    puts " #{computer.name}'s hand  |  Total: #{computer.visible_total} |"
    puts "-------------------------------------------------------"
    puts computer.visible_cards.inspect
    puts
    puts
    puts " #{human.name}'s hand       |  Total: #{human.calculate_total} |"
    puts "-------------------------------------------------------"
    puts human.cards.inspect
    puts
    puts "                 Cards left in deck: #{deck.cards.count}"
    puts
  end

  def setup
    deal
    computer.display_one_card
    computer.display_partial_total
    display_hands
  end

  def play_again?
    puts "Would you like to play again #{human.name}? ('y' or 'n')"
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Please enter either 'y' or 'n'."
    end
    answer == 'y'
  end

  def goodbye_message
    puts "Thanks for playing TwentyOne!"
  end

  def welcome_message
    system 'clear'
    puts "Welcome to TwentyOne!"
    sleep 1
  end

  def start
    welcome_message
    human.set_name
    game
  end

  def reset
    @deck = Deck.new
    human.cards = []
    @computer = Dealer.new
  end

  def game
    loop do
      setup
      player_turn
      computer_turn unless human.bust?
      print_result
      break unless play_again?
      reset
    end
    goodbye_message
  end
end

Game.new.start