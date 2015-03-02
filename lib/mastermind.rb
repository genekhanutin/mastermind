require_relative 'response'
require_relative 'guess_checker'
require 'pry'

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
    user_input = gets.chomp.downcase
    if user_input == "p" 
      color_shuffle
       Response.generated_sequence_guess_message
      while user_input != "q" 
        print "Enter a guess: "
        user_input = gets.chomp.downcase
        if ["q", "i", "c"].include?(user_input)
          evaluate_special_command(user_input)
        else
          gc = GuessChecker.new(user_input, @generated_sequence)
          puts gc.evaluate_guess
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

  def evaluate_special_command(command)
    if command == "q"
      exit_game
    elsif command == "i"
     puts "instructions"
    elsif command == "c"
     puts generated_sequence
    end
  end

  def exit_game
    Response.goodbye_message
    exit
  end

end


