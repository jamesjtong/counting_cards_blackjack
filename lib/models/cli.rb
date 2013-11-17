class CLI
  COMMANDS = [:help, :exit, :hit, :card_count]

  def start
    puts "So what's your name?"
    @player = Player.new(gets.chomp.strip)
  end

  def true_count
    
  end

end