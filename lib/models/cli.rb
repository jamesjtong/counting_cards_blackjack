class CLI
  COMMANDS = [:help, :exit, :hit, :guess_count, :stand, :my_score]

  def initialize
    puts "*Welcome to Counting Cards BlackJack*\n"
    @player = Player.new
    @current_deck = Deck.new
    @on = true
    @current_deck.deal_hands
  end

  def my_score
    @player.score
  end

  def help
    puts "Please enter any of the following commands: hit, stand, guess_count, exit or guess_aces \n"
    self.command_request
  end



  def hit
    @current_deck.hit(@current_deck.user_hand)
    puts "\nThe dealer shows #{@current_deck.dealer_hand}\n\n You have #{@current_deck.user_hand}.\n What do you want to do?"
  end

  def stand
    @current_deck.stand
  end

  def guess_count
    @player.guess_count
  end

  def guess_aces
    @player.guess_aces
  end

  def call
    while @on == true
      self.help
    end

  end

  def exit
    @on = false
  end

  def command(input)
    send(input) if command_valid?(input)
  end

  def command_valid?(input)
    COMMANDS.include?(input.downcase.to_sym)
  end

  def user_input
    gets.downcase.strip
  end

  def command_request
    self.command(user_input)
  end

end