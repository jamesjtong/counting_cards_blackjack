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

  def create_decks
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
      @deck << create_decks
    end
  end

  def set_counts
    @true_count = 0
    @ace_count = 0
  end

  def deal_hand
    puts "dealing new hands"
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


  def hit
    @user_hand << check_count(deck.pop)
  end

  def hand_score
    @score = 0
    @aces = 0
    @user_hand.each do |card|
      if FACECARDS.include?(card[0])
        @score += 10
      elsif card[0] == "A"
        if @score >= 10
          @score += 11
        else
          @score += 1
        end
      else
        @score += card[0].to_i
      end
    end
    @score
  end

  def detect_bust
    if hand_score > 21
      self.busted
    end
  end

  def busted
    puts "Busted!"
    deal_hand
  end

end
