class CLI
  COMMANDS = [:help, :exit, :hit, :guess_count, :guess_aces, :stand, :my_score]

  def initialize
    puts "*Welcome to Counting Cards BlackJack*\n"
    @player = Player.new
    @current_deck = Game.new
    @on = true
    @current_deck.deal_hands
    @player.game = @current_deck
  end

  def my_score
    @player.score
  end

  def help
    puts "Please enter any of the following commands: hit, stand, guess_count, guess_aces, or exit \n"
    self.command_request
  end

  def hit
    @current_deck.hit(@current_deck.user_hand)
  end

  def stand
    @current_deck.stand
  end

  def guess_count
    puts "\nInput the current count"
    @player.guess_count

  end

  def guess_aces
    puts "\nInput the number of aces shown so far"
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