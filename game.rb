require_relative 'instructions.rb'
class Mastermind

include Instructions


  def initialize
    @human_code = false
    @human_break = false
    @computer_code = []
    @colors = {
      '1' => BLUE1,
      '2' => BROWN2,
      '3' => CYAN3,
      '4' => MAGENTA4,
      '5' => GREEN5,
      '6' => RED6
    }
    human_or_computer()
    display_colors()
    if @human_code then
      start_game_human_coder()
    end
    if @human_break then
      start_game_human_breaker()
    end
  end

  def human_or_computer
    while game_mode_input = gets.chomp.to_i 
    case game_mode_input
    when 1 
      @human_code = true
      puts "You are now the code MAKER"
      break
    when 2
      @human_break = true
      puts "You are now the code BREAKER"
      break
    else
      puts "Invalid input. Please try again, use 1 or 2"
      print '> '
    end 
    end
  end

  def display_colors
    puts ALLCOLORS
  end

  def start_game_human_coder
    puts 'Human coder'
  end

  def start_game_human_breaker
    @computer_code = 4.times.map{ Random.rand(6) }
    puts "Secret code has been generated by the computer, please enter your guess with 4 numbers between 1-6"
    print '> '
    player_choice()
  end
  def player_choice
    



  
end
