require 'pry'
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
SUITES = %w(S C D H)

def initialize_cards(values, suites)
  cards = []
  values.each do |val|
    suites.each do |suite|
      cards << [val, suite]
    end
  end
  cards
end

def display_hands(players_cards, dealers_cards, player_total, dealer_total)
  system 'clear'
  puts
  puts
  puts "   Here is the dealer's hand  |  Total: #{dealer_total} |"
  puts "-------------------------------------------------------"
  puts dealers_cards.inspect
  puts
  puts
  puts "      Here is your hand       |  Total: #{player_total} |"
  puts "-------------------------------------------------------"
  puts players_cards.inspect
  puts
  puts
end

def total(cards_in_hand)
  sum = 0
  cards_in_hand.each do |value|
    if value[0] == "A"
      sum += 11
    elsif value[0].to_i == 0
      sum += 10
    else
      sum += value[0].to_i
    end
  end

  cards_in_hand.select { |value| value[0] == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def prompt(words)
  puts "=> #{words}"
end

def detect_result_player(player_total)
  if player_total > 21
    :player_busted
  elsif player_total == 21
    :Player_21
  end
end

def print_result_player(result)
  case result
  when :player_busted
    prompt "You Busted!"
  when :player_21
    prompt "You got 21!"
  end
end

def detect_winner(player_total, dealer_total)
  if player_total > 21
    :dealer
  elsif dealer_total > 21
    :player
  elsif dealer_total == 21
    :dealer
  elsif player_total > dealer_total
    :player
  else
    :dealer
  end
end

def detect_result_dealer(dealer_total)
  if dealer_total > 21
    :dealer_busted
  elsif dealer_total == 21
    :dealer_21
  elsif dealer_total > 16
    :dealer_stays
  end
end

def print_result_dealer(result)
  case result
  when :dealer_busted
    prompt "Dealer Busted!"
  when :dealer_21
    prompt "Dealer got 21!"
  when :dealer_stays
    prompt "Dealer stays."
  end
end

def print_winner(detect_winner)
  case detect_winner
  when :dealer
    prompt "Dealer wins!"
  when :player
    prompt "You win!"
  else
    prompt "there's a bug!!!"
  end
end

system 'clear'
puts "--------------------------------------------"
puts "------------Welcome to 21 EXTREME-----------"
puts "-------Tie the dealer, lose the hand--------"
puts "--------------------------------------------"
sleep(3)
loop do
  player_score = 0
  dealer_score = 0

  loop do
    deck = initialize_cards(VALUES, SUITES).shuffle!
    players_cards = []
    dealers_cards = []

    2.times do
      players_cards << deck.pop
      dealers_cards << deck.pop
    end
    dealers_visible_card = dealers_cards[0].clone

    player_total = total(players_cards)
    dealer_total = total(dealers_cards)
    display_hands(players_cards, dealers_visible_card, player_total, "?")
    prompt "Type: \"h\" to \"hit!\"  Type: \"s\" to \"stay\"."

    loop do
      if dealer_total == 21
        prompt "Dealer got 21!"
        break
      end
      answer = gets.chomp
      if answer.downcase.start_with?('s')
        prompt "You chose to stay."
        break
      elsif answer.downcase.start_with?('h')
        prompt "Hit!"
        sleep(0.5)
        players_cards << deck.pop
        player_total = total(players_cards)
        display_hands(players_cards, dealers_visible_card, player_total, "?")
      else
        prompt "Please enter either \"h\" or \"s\"."
      end

      result = detect_result_player(player_total)
      if result
        print_result_player(result)
        sleep(2)
        break
      end
    end

    loop do
      break if player_total > 21

      result = detect_result_dealer(dealer_total)
      if result
        display_hands(players_cards, dealers_cards, player_total, dealer_total)

        print_result_dealer(result)
        sleep(2)
        break
      else
        prompt "Dealer takes a card."
        sleep(1)
        dealers_cards << deck.pop
        dealer_total = total(dealers_cards)
        display_hands(players_cards, dealers_cards, player_total, dealer_total)
      end
    end

    winner = detect_winner(player_total, dealer_total)
    if winner == :player
      player_score += 1
    else
      dealer_score += 1
    end

    print_winner(winner)
    puts "You won #{player_score} games AND Dealer won #{dealer_score}."
    sleep(1)
    if player_score == 5
      prompt "You've beat the house!!!"
      break
    elsif dealer_score == 5
      prompt "...you're broke... Please go home now."
      break
    else
      prompt "loading next game..."
      sleep(1)
    end
  end

  prompt "Play again? (y/n)"
  play_again = nil
  loop do
    play_again = gets.chomp
    break if ['y', 'n'].include?(play_again)
    prompt "Please enter \"y\" or \"n\"."
  end

  if play_again == 'n'
    prompt "Thanks for playing 21!"
    break
  else
    prompt "Game on!"
    next
  end
end
