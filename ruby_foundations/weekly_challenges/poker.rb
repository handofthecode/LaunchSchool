class Poker
  def initialize(hands)
    @hands = hands.map { |arr| Hand.new(arr) }
  end

  def best_hand
    top_score = @hands.reduce {|mem, hand| hand.rank > mem.rank ? hand : mem}
    result = []
    @hands.each {|hand| result << hand.to_a if hand.rank == top_score.rank}
    result
  end
end

class Hand
  attr_reader :rank, :cards

  def initialize(cards)
    @cards = cards.map { |card| Card.new(card) }
    @rank = evaluate
  end

  def to_a
    @cards.map {|card| card.to_s }
  end

  private

  def evaluate
    case
    when royal_flush?     then 900
    when straight_flush?  then 800 + @cards.max.value
    when four_of_a_kind?  then 700 + highest_tuplet_value(4)
    when full_house?      then 600 + highest_tuplet_value(3)
    when flush?           then 500 + @cards.max.value
    when straight?        then 400 + @cards.max.value
    when three_of_a_kind? then 300 + highest_tuplet_value(3)
    when two_pair?        then 200 + highest_tuplet_value(2)
    when pair?            then 100 + highest_tuplet_value(2)
    else                       0 + @cards.max.value
    end
  end

  def highest_tuplet_value(n)
    vals = @cards.map { |c| c.value }
    vals.select { |v| vals.count(v) == n }.reduce { |m, v| v > m ? v : m }
  end

  def royal_flush?
    flush? && straight? && @cards.last.rank == "A"
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    organize_values(4, 2)
  end

  def full_house?
    organize_values(3, 2)
  end

  def flush?
    suit_to_check = @cards[0].suit
    !@cards.any? { |card| card.suit != suit_to_check }
  end

  def straight?
    values = @cards.map { |card| card.value }.sort
    check = values.map { |card| card - values[0] }
    values.last == 14 ? check[0..3] == [0, 1, 2, 3] : check == [0, 1, 2, 3, 4]
  end

  def three_of_a_kind?
    organize_values(3, 3)
  end

  def two_pair?
    organize_values(2, 3)
  end

  def pair?
    organize_values(2, 4)
  end
  
  def organize_values(max_tuple, n_value_groups)
    result = @cards.each_with_object(Hash.new(0)) { |c, h| h[c.value] += 1 }
    result.values.max == max_tuple && result.values.size == n_value_groups
  end
end

class Card
  attr_reader :rank, :suit
  include Comparable
  def initialize(val_and_suit)
    @rank = val_and_suit[0]
    @suit = val_and_suit[1]
  end
  
  VALUES = { 'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14 }
  SUITS = { 'D' => 1, 'C' => 2, 'H' => 3, 'S' => 4 }

  def value
    VALUES.fetch(@rank, @rank).to_i
  end

  def compare_suit
    SUITS.fetch(suit)
  end

  def to_s
    "#{@rank}#{@suit}"
  end

  def <=>(other_card)
    return compare_suit <=> other_card.compare_suit if value == other_card.value
    value <=> other_card.value
  end
end
