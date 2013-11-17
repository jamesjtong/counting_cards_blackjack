class Player
  attr_accessor :times_wrong, :score

  def initialize
    @score = 0
  end

  def guess_count
    answer = gets.chomp.strip
    if answer == @current_deck.true_count
      score += 1
    else
      score -= 1
    end
  end

  def guess_aces
    answer = gets.chomp.strip
    if answer == @current_deck.ace_count
      score += 1
    else
      score -= 1
    end
  end

  
end