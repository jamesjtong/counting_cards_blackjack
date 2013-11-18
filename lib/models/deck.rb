class Deck
  attr_reader :deck, :true_count, :ace_count, :dealer_hand, :user_hand
  FACECARDS = %w(J Q K)
  PLUS_COUNT = %w(2 3 4 5 6) 
  NEUTRAL_COUNT = %w(7 8 9)
  MINUS_COUNT = %w(10 J Q K A)

  def initialize
    self.create_standard_six_decks
    self.deck.flatten!.shuffle!
    self.set_counts
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
    detect_player_bust
    detect_dealer_bust
  end

  def stand
    hand_score(self.dealer_hand) >= 17 ? compare_hand_value : hit(self.dealer_hand)

  end

  def dealer_hits_until_17
    @new_hand = false
    until hand_score(@dealer_hand) >= 17 
      break if @new_hand == true
      hit(@dealer_hand)
      puts "Dealer Hits! His hand is now #{@dealer_hand}"
    end
  end

  def compare_hand_value
    if hand_score(@dealer_hand) > hand_score(@user_hand)
      puts "You lose"
    else
      puts "You win this hand"
    end
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



  def detect_bust(hand)
    if hand_score(hand) > 21
      self.busted
    end
  end

  def detect_dealer_bust
    if hand_score(@dealer_hand) > 21
      puts "DEALER BUSTED, you win"
      @new_hand = true
      deal_hands
    end
  end

  def detect_player_bust
    if hand_score(@player_hand) > 21
      puts "PLAYER BUSTED, you lose"
      @new_hand = true
      deal_hands
    end

  end


end
