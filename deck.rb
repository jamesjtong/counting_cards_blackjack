require 'pry'
class Deck
  attr_reader :deck
  FACECARDS = %w(J Q K)
  def initialize
    self.create_standard_six_decks
    self.deck.flatten!.shuffle!
  end

  def create_decks
    card_num = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    card_suit = %w(Diamonds Clubs Hearts Spades)
    @standard_deck = 
      card_num.flat_map do |card|
        card_suit.flat_map do |suit|
          card+" of "+suit
        end
      end
  end
  #wanted to create 1 single array, not an array of arrays so using flat_map

  def create_standard_six_decks
    @deck = []
    6.times do |make_deck|
      @deck << create_decks
    end
  end

  def deal_hand
    @user_hand = [deck.pop, deck.pop]
  end

  def hit
    @user_hand << deck.pop
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
      puts "Busted"
    end
  end


end

y = Deck.new
binding.pry