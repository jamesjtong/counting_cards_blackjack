class CLI
  COMMANDS = [:help, :exit, :hit, :card_count, :stand]

  def initialize
    puts "*Welcome to Counting Cards BlackJack*\n"
    @player = Player.new
    @current_deck = Deck.new
    @on = true
  end

  def my_score
    @player.score
  end

  def help
    puts "Please enter any of the following commands:\n"
    self.command_request
  end

  def hit
    @current_deck.hit
  end


  def guess_score
    @player.guess_score
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