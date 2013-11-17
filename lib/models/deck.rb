class Deck
  attr_reader :deck, :true_count, :ace_count
  FACECARDS = %w(J Q K)
  PLUS_COUNT = %w(2 3 4 5 6) 
  NEUTRAL_COUNT = %w(7 8 9)
  MINUS_COUNT = %w(10 J Q K A)

  def initialize
    self.create_standard_six_decks
    self.deck.flatten!.shuffle!
  end

  def create_deck
    card_num = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    card_suit = %w(Diamonds Clubs Hearts Spades)
    @standard_deck = 
      card_num.map do |card|
        card_suit.map do |suit|
          card+" of "+suit
        end
      end.flatten
  end

  def create_standard_six_decks
    @deck = []
    6.times do |make_deck|
      @deck << create_deck
    end
  end

  def set_counts
    @true_count = 0
    @ace_count = 0
  end

  def deal_hands
    puts "dealing new hands"
    @dealer_hand = [check_count(deck.pop)]
    @user_hand = [check_count(deck.pop), check_count(deck.pop)]
  end

  def check_count(card)
    if card[0] == "A"
      @ace_count += 1
    end
    if PLUS_COUNT.include?(card[0])
      @true_count += 1
    elsif MINUS_COUNT.include?(card[0])
      @true_count -= 1
    end
    card
  end


  def hit(hand)
    hand << check_count(deck.pop)
    detect_bust(hand)
  end

  def stand
    dealer_hits_until_17
    compare_hand_value
  end


  def hand_score(hand)
    score = 0
    hand.each do |card|
      if FACECARDS.include?(card[0])
        score += 10
      elsif card[0] == "A"
        if score >= 10
          score += 11
        else
          score += 1
        end
      else
        score += card[0].to_i
      end
    end
    score
  end

  def dealer_hits_until_17
    until hand_score(@dealer_hand) >= 17
      dealer.hit
    end
  end

  def compare_hand_value
    if hand_score(@dealer_hand) > hand_score(@user_hand) && hand_score(@dealer_hand) < 22
      puts "You lose"
    else
      puts "You win this hand"
    end
  end

  def detect_bust(hand)
    if hand_score(hand) > 21
      self.busted
    end
  end

  def busted
    puts "Busted! Time for a new Hand"
    deal_hand
  end

end
