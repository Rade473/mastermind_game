require File.expand_path('../game.rb',__FILE__ )
class Computer < Mastermind
  def initialize
    @human_code = []
    @range = [1, 2, 3, 4, 5, 6]
    @all_combinations = @range.repeated_permutation(4).to_a
    code_creation()

  end
  
  def code_creation
    puts 'Please enter your secret code, using numbers from 1-6'
    while (userinput = gets.chomp.split('').to_a)
    if userinput.length == 4 && userinput.all? { |input| @@colors.include?(input)}
      @human_code.replace(userinput)
      p @human_code
    break
    else
      puts 'Invalid input'
      print '> '
    end
    
  end
  display_player_choice(@human_code)
  computer_game(@human_code)
end

def computer_game(code)
p @all_combinations.length
end
end