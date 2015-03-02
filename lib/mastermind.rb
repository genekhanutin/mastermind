require_relative 'response'
require_relative 'guess_checker'


class Mastermind
  
  attr_reader :correct_color_count,
              :correct_position_count,
              :generated_sequence
              

  attr_accessor :guess

  def initialize
    @colors = ['r','g','b','y']
    @generated_sequence = nil
  end

  def start_game
    print ">>>"
    user_input = gets.chomp.downcase
    if user_input == "p" || user_input == "play"
      color_shuffle
      guesser = GuessChecker.new(@generated_sequence)
      Response.generated_sequence_guess_message
      while user_input != "q" || user_input == "quit"
        print "Enter a guess \n(select (c)heat for answer): "
        user_input = gets.chomp.downcase
        if ["q", "i", "c"].include?(user_input)
          evaluate_special_command(user_input)
        else
          puts guesser.evaluate_guess(user_input)
        end
      end
    elsif user_input == "q"
      exit_game
    else
      puts Response.unknown_input 
    end
  end

  def color_shuffle
    @generated_sequence = (@colors * 5).sample(4).join
  end

  def evaluate_special_command(user_input)
    if user_input == "q"
      exit_game
    elsif user_input == "i"
     Response.new.game_instructions
    elsif user_input == "c"
     puts generated_sequence
    end
  end

  def exit_game
    Response.goodbye_message
    exit
  end

end


