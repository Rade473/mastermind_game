require File.expand_path('../game.rb',__FILE__ )
class Computer < Mastermind
  def initialize
    @human_code = []
    @computer_guess = [1,1,2,2]
    @rounds = 0
    @range = [1, 2, 3, 4, 5, 6]
    @computer_win = false
    @clues = []
    @colored_pegs = 0
    @white_pegs = 0
    @all_combinations = @range.repeated_permutation(4).to_a
    code_creation()
   
  end
  
  def code_creation
    puts 'Please enter your secret code, using numbers from 1-6'
    while (userinput = gets.chomp.split('').to_a)
    if userinput.length == 4 && userinput.all? { |input| @@colors.include?(input)}
      @human_code.replace(userinput)
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
    until @computer_win == true
    if @computer_guess == code.map!(&:to_i)
      puts "Combination tried #{@computer_guess}"
      puts "Computer won in #{@rounds} rounds!"
      @computer_win = true
      break
    else 
      get_clues_computer(@computer_guess, @human_code)
      filter_for_guess(@colored_pegs, @white_pegs, @computer_guess, @human_code)
      @rounds +=1
    end
    
  end
  new_game()
  end
  
  def get_clues_computer(guess, code)
    temp_guess = guess.dup
    temp_code = code.dup
    @colored_pegs = 0 
    @white_pegs = 0
    temp_guess.each_with_index do |n, i|
      if temp_guess[i] == temp_code[i]
        @clues << COLOREDCLUE
        @colored_pegs += 1
        temp_guess[i] = 0
        temp_code[i] = 10
      end
    end
    temp_code.each do |n|
      if temp_guess.include?(n)
        @clues << NONCOLOREDCLUE
        @white_pegs += 1
      end
    end
    puts "Combination tried #{@computer_guess}"
    puts @clues.sort.map { |e| "#{e}"}.join('')
    @clues = []
  end

  def filter_for_guess(colored_pegs, white_pegs,guess,code)
    new_guess_pool = []
    @all_combinations.each do |combination|
      temp_code = combination.dup
      temp_guess = guess.dup
      cp = 0
      wp = 0
      temp_code.each_with_index do |_n, i|
        if temp_guess[i] == temp_code[i]
          temp_guess[i] = 0
          temp_code[i] = 10
          cp += 1
          end
        end
      temp_code.each do |n|
          if temp_guess.include?(n)
            wp += 1
          end
        end
        if cp == colored_pegs && wp == white_pegs
          new_guess_pool.push(combination)
        end
      end
    @computer_guess = new_guess_pool[0]
    @all_combinations.replace(new_guess_pool)
  end
  
end