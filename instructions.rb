module Instructions
  public 
BLUE1= "\e[44m  1  \e[0m"
BROWN2 = "\e[43m  2  \e[0m"
CYAN3 =  "\e[46m  3  \e[0m"
MAGENTA4 = "\e[45m  4  \e[0m"
GREEN5 = "\e[42m  5  \e[0m"
RED6 = "\e[41m  6  \e[0m"
ALLCOLORS = BLUE1 + " " + BROWN2 + " " + CYAN3 + " " + MAGENTA4 + " " + GREEN5 + " " + RED6
COLOREDCLUE = "\e[31m \u2022 \e[0m"
NONCOLOREDCLUE = " \u2022 "

  def red
    "\e[31m#{self}\e[0m"
  end

  def bg_red
    "\e[41m#{self}\e[0m"
  end

  def bg_green
    "\e[42m#{self}\e[0m"
  end

  def bg_brown
    "\e[43m#{self}\e[0m"
  end

  def bg_blue
    "\e[44m#{self}\e[0m"
  end

  def bg_magenta
    "\e[45m#{self}\e[0m"
  end

  def bg_cyan
    "\e[46m#{self}\e[0m"
  end
 

  def show_insturctions
    puts "\e[1mHow to play Mastermind:\e[0m"
    puts "This is a 1-player game against the computer."
    puts "You can choose to be the code maker or the code breaker."
    puts "\n"
    puts "There are six different number/color combinations:\n"
    puts "  1  ".bg_blue + ' ' + "  2  ".bg_brown + ' ' + "  3  ".bg_cyan + ' ' + "  4  ".bg_magenta + " " + "  5  ".bg_green + " " + "  6  ".bg_red
    puts "\n"
    puts "The code maker will choose four to create a 'master code'. For example, \n"
    puts "  1  ".bg_blue + ' ' + "  3  ".bg_cyan + ' ' + "  4  ".bg_magenta + " " + "  1  ".bg_blue
    puts "As you can see, there can be " + "more than one ".red+"of the same number/color."
    puts "In order to win, the code breaker needs to guess the 'master code' in 12 or less turns."
    puts "\n"
    puts "\e[1mClues\e[0m"
    puts "\n"
    puts "After each guess, there will be up to four clues to help crack the code."
    puts "\u2022" + " - This clue means you have 1 correct number, but in the wrong location."
    puts "\u2022".red + " - This clue means you have 1 correct number in the correct location."
    puts "\n"
    puts "\e[1mClue Example:\e[0m"
    puts "To continue the example, using the above 'master code' a guess of '1463' would produce 3 clues:"
    puts "\n"
    puts "  1  ".bg_blue + ' ' + "  4  ".bg_magenta + " " + "  6  ".bg_red + ' ' + "  3  ".bg_cyan + "  Clues: " + "\u2022 ".red + "\u2022 " + "\u2022 "
    puts "\n"
    puts "The guess had 1 correct number in the correct location and 2 correct numbers in a wrong location."
    puts "\n"
    puts "\e[1mIt's time to play!\e[0m"
    puts "Would you like to be the code MAKER or code BREAKER?"
    puts "Press '1' to be the code MAKER"
    puts "Press '2' to be the code BREAKER"
  end
end


