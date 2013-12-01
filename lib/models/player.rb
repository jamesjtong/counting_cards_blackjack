class Player
  attr_accessor :times_wrong, :score, :current_deck, :game

  def initialize
    @score = 0
    @times_wrong = 0
  end

  def guess_count
    answer = gets.chomp.strip
    if answer == game.true_count.to_s
      @score += 1
      puts "correct!"

    else
      @score -= 1
      @times_wrong += 1
      puts "wrong"
    end
    puts "Your current score is #{self.score}"
  end

  def guess_aces
    answer = gets.chomp.strip
    if answer == game.ace_count.to_s
      puts "Correct"
      @score += 1
    else
      puts "WRONG"
      @score -= 1
    end
    puts "Your current score is #{self.score}"
  end

  
end